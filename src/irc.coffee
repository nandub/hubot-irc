# Hubot dependencies
{Robot, Adapter, TextMessage, EnterMessage, LeaveMessage, Response} = require 'hubot'

# Custom Response class that adds a sendPrivate method
class IrcResponse extends Response
  sendPrivate: (strings...) ->
    @robot.adapter.sendPrivate @envelope, strings...

# Irc library
Irc = require 'irc'

Log = require('log')
logger = new Log process.env.HUBOT_LOG_LEVEL or 'info'

class IrcBot extends Adapter
  send: (envelope, strings...) ->
    # Use @notice if SEND_NOTICE_MODE is set
    return @notice envelope, strings if process.env.HUBOT_IRC_SEND_NOTICE_MODE?

    target = @_getTargetFromEnvelope envelope

    unless target
      return logger.error "ERROR: Not sure who to send to. envelope=", envelope

    for str in strings
      logger.debug "#{target} #{str}"
      @bot.say target, str

  sendPrivate: (envelope, strings...) ->
    # Remove the room from the envelope and send as private message to user

    if envelope.room
      delete envelope.room

    if envelope.user?.room
      delete envelope.user.room

    @send envelope, strings...

  topic: (envelope, strings...) ->
    data = strings.join " / "
    channel = envelope.room
    @bot.send 'TOPIC', channel, data

  emote: (envelope, strings...) ->
    # Use @notice if SEND_NOTICE_MODE is set
    return @notice envelope, strings if process.env.HUBOT_IRC_SEND_NOTICE_MODE?

    target = @_getTargetFromEnvelope envelope

    unless target
      return logger.error "ERROR: Not sure who to send to. envelope=", envelope

    for str in strings
      @bot.action target, str

  notice: (envelope, strings...) ->
    target = @_getTargetFromEnvelope envelope

    unless target
      return logger.warn "Notice: no target found", envelope

    # Flatten out strings from send
    flattened = []
    for str in strings
      if typeof str != 'undefined'
        for line in str.toString().split(/\r?\n/)
          if Array.isArray line
            flattened = flattened.concat line
          else
            flattened.push line

    for str in flattened
      if not str?
        continue

      @bot.notice target, str

  reply: (envelope, strings...) ->
    for str in strings
      @send envelope.user, "#{envelope.user.name}: #{str}"

  join: (channel) ->
    self = @
    @bot.join channel, () ->
      logger.info('joined %s', channel)

      selfUser = self.getUserFromName self.robot.name
      self.receive new EnterMessage(selfUser)

  part: (channel) ->
    self = @
    @bot.part channel, () ->
      logger.info('left %s', channel)

      selfUser = self.getUserFromName self.robot.name
      self.receive new LeaveMessage(selfUser)

  getUserFromName: (name) ->
    return @robot.brain.userForName(name) if @robot.brain?.userForName?

    # Deprecated in 3.0.0
    return @userForName name

  getUserFromId: (id) ->
    # TODO: Add logic to convert object if name matches
    return @robot.brain.userForId(id) if @robot.brain?.userForId?

    # Deprecated in 3.0.0
    return @userForId id

  createUser: (channel, from) ->
    user = @getUserFromId from
    user.name = from

    if channel.match(/^[&#]/)
      user.room = channel
    else
      user.room = null
    user

  kick: (channel, client, message) ->
    @bot.emit 'raw',
      command: 'KICK'
      nick: process.env.HUBOT_IRC_NICK
      args: [ channel, client, message ]

  command: (command, strings...) ->
    @bot.send command, strings...

  checkCanStart: ->
    if not process.env.HUBOT_IRC_NICK and not @robot.name
      throw new Error("HUBOT_IRC_NICK is not defined; try: export HUBOT_IRC_NICK='mybot'")
    else if not process.env.HUBOT_IRC_ROOMS
      throw new Error("HUBOT_IRC_ROOMS is not defined; try: export HUBOT_IRC_ROOMS='#myroom'")
    else if not process.env.HUBOT_IRC_SERVER
      throw new Error("HUBOT_IRC_SERVER is not defined: try: export HUBOT_IRC_SERVER='irc.myserver.com'")

  unfloodProtection: (unflood) ->
    unflood == 'true' or !isNaN(parseInt(unflood))

  unfloodProtectionDelay: (unflood) ->
    unfloodProtection = @unfloodProtection(unflood)
    unfloodValue = parseInt(unflood) or 1000

    if unfloodProtection
      unfloodValue
    else
      0

  run: ->
    self = @

    do @checkCanStart

    options =
      nick:     process.env.HUBOT_IRC_NICK or @robot.name
      realName: process.env.HUBOT_IRC_REALNAME
      port:     process.env.HUBOT_IRC_PORT
      rooms:    process.env.HUBOT_IRC_ROOMS.split(",")
      ignoreUsers: process.env.HUBOT_IRC_IGNORE_USERS?.split(",") or []
      server:   process.env.HUBOT_IRC_SERVER
      password: process.env.HUBOT_IRC_PASSWORD
      nickpass: process.env.HUBOT_IRC_NICKSERV_PASSWORD
      nickusername: process.env.HUBOT_IRC_NICKSERV_USERNAME
      connectCommand: process.env.HUBOT_IRC_CONNECT_COMMAND
      fakessl:  process.env.HUBOT_IRC_SERVER_FAKE_SSL?
      certExpired: process.env.HUBOT_IRC_SERVER_CERT_EXPIRED?
      unflood:  process.env.HUBOT_IRC_UNFLOOD
      debug:    process.env.HUBOT_IRC_DEBUG?
      usessl:   process.env.HUBOT_IRC_USESSL?
      userName: process.env.HUBOT_IRC_USERNAME

    client_options =
      userName: options.userName
      realName: options.realName
      password: options.password
      debug: options.debug
      port: options.port
      stripColors: true
      secure: options.usessl
      selfSigned: options.fakessl
      certExpired: options.certExpired
      floodProtection: @unfloodProtection(options.unflood),
      floodProtectionDelay: @unfloodProtectionDelay(options.unflood),

    client_options['channels'] = options.rooms unless options.nickpass

    # Override the response to provide a sendPrivate method
    @robot.Response = IrcResponse

    @robot.name = options.nick
    bot = new Irc.Client options.server, options.nick, client_options

    next_id = 1
    user_id = {}

    if options.nickpass?
      identify_args = ""

      if options.nickusername?
        identify_args += "#{options.nickusername} "

      identify_args += "#{options.nickpass}"

      bot.addListener 'notice', (from, to, text) ->
        if from is 'NickServ' and text.toLowerCase().indexOf('identify') isnt -1
          bot.say 'NickServ', "identify #{identify_args}"
        else if options.nickpass and from is 'NickServ' and
                (text.indexOf('Password accepted') isnt -1 or
                 text.indexOf('identified') isnt -1)
          for room in options.rooms
            @join room

    if options.connectCommand?
      bot.addListener 'registered', (message) ->
        # The 'registered' event is fired when you are connected to the server
        strings = options.connectCommand.split " "
        self.command strings.shift(), strings...

    bot.addListener 'names', (channel, nicks) ->
      for nick of nicks
        self.createUser channel, nick

    bot.addListener 'notice', (from, to, message) ->
      return unless from

      if from in options.ignoreUsers
        logger.info('Ignoring user: %s', from)
        # we'll ignore this message if it's from someone we want to ignore
        return

      logger.info "NOTICE from #{from} to #{to}: #{message}"

      user = self.createUser to, from
      self.receive new TextMessage(user, message)

    bot.addListener 'message', (from, to, message) ->
      return unless from
      
      if options.nick.toLowerCase() == to.toLowerCase()
        # this is a private message, let the 'pm' listener handle it
        return

      if from in options.ignoreUsers
        logger.info('Ignoring user: %s', from)
        # we'll ignore this message if it's from someone we want to ignore
        return

      logger.debug "From #{from} to #{to}: #{message}"

      user = self.createUser to, from
      if user.room
        logger.debug "#{to} <#{from}> #{message}"
      else
        unless message.indexOf(to) == 0
          message = "#{to}: #{message}"
        logger.debug "msg <#{from}> #{message}"

      self.receive new TextMessage(user, message)

    bot.addListener 'action', (from, to, message) ->
      logger.debug " * From #{from} to #{to}: #{message}"

      if from in options.ignoreUsers
        logger.info('Ignoring user: %s', from)
        # we'll ignore this message if it's from someone we want to ignore
        return

      user = self.createUser to, from
      if user.room
        logger.debug "#{to} * #{from} #{message}"
      else
        logger.debug "msg <#{from}> #{message}"

      self.receive new TextMessage(user, message)

    bot.addListener 'error', (message) ->
      logger.error('ERROR: %s: %s', message.command, message.args.join(' '))

    bot.addListener 'pm', (nick, message) ->
      logger.info('Got private message from %s: %s', nick, message)

      if process.env.HUBOT_IRC_PRIVATE
        return

      if nick in options.ignoreUsers
        logger.info('Ignoring user: %s', nick)
        # we'll ignore this message if it's from someone we want to ignore
        return

      nameLength = options.nick.length
      if message.slice(0, nameLength).toLowerCase() != options.nick.toLowerCase()
        message = "#{options.nick} #{message}"

      self.receive new TextMessage({reply_to: nick, name: nick}, message)

    bot.addListener 'join', (channel, who) ->
      logger.info('%s has joined %s', who, channel)
      user = self.createUser channel, who
      user.room = channel
      self.receive new EnterMessage(user)

    bot.addListener 'part', (channel, who, reason) ->
      logger.info('%s has left %s: %s', who, channel, reason)
      user = self.createUser '', who
      user.room = channel
      msg = new LeaveMessage user
      msg.text = reason
      self.receive msg

    bot.addListener 'quit', (who, reason, channels) ->
      logger.info '%s has quit: %s (%s)', who, channels, reason
      for ch in channels
        user = self.createUser '', who
        user.room = ch
        msg = new LeaveMessage user
        msg.text = reason
        self.receive msg

    bot.addListener 'kick', (channel, who, _by, reason) ->
      logger.info('%s was kicked from %s by %s: %s', who, channel, _by, reason)

    bot.addListener 'invite', (channel, from) ->
      logger.info('%s invited you to join %s', from, channel)

      if from in options.ignoreUsers
        logger.info('Ignoring user: %s', from)
        # we'll ignore this message if it's from someone we want to ignore
        return
      
      if not process.env.HUBOT_IRC_PRIVATE or process.env.HUBOT_IRC_IGNOREINVITE
        bot.join channel

    @bot = bot

    self.emit "connected"

  _getTargetFromEnvelope: (envelope) ->
    user = null
    room = null
    target = null

    # as of hubot 2.4.2, the first param to send() is an object with 'user'
    # and 'room' data inside. detect the old style here.
    if envelope.reply_to
      user = envelope
    else
      # expand envelope
      user = envelope.user
      room = envelope.room

    if user
      # most common case - we're replying to a user in a room
      if user.room
        target = user.room
      # reply directly
      else if user.name
        target = user.name
      # replying to pm
      else if user.reply_to
        target = user.reply_to
      # allows user to be an id string
      else if user.search?(/@/) != -1
        target = user
    else if room
      # this will happen if someone uses robot.messageRoom(jid, ...)
      target = room

    target

exports.use = (robot) ->
  new IrcBot robot
