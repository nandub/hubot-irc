# Hubot dependencies
{Robot, Adapter, TextMessage, EnterMessage, LeaveMessage, Response} = require 'hubot'

# Irc library
Irc = require 'irc'

class IrcBot extends Adapter
  send: (envelope, strings...) ->
    # Use @notice if SEND_NOTICE_MODE is set
    return @notice envelope, strings if process.env.HUBOT_IRC_SEND_NOTICE_MODE?

    target = @_getTargetFromEnvelope envelope

    unless target
      return console.log "ERROR: Not sure who to send to. envelope=", envelope

    for str in strings
      @bot.say target, str

  emote: (envelope, strings...) ->
    # Use @notice if SEND_NOTICE_MODE is set
    return @notice envelope, strings if process.env.HUBOT_IRC_SEND_NOTICE_MODE?

    target = @_getTargetFromEnvelope envelope

    unless target
      return console.log "ERROR: Not sure who to send to. envelope=", envelope

    for str in strings
      @bot.action target, str

  notice: (envelope, strings...) ->
    target = @_getTargetFromEnvelope envelope

    unless target
      return console.log "Notice: no target found", envelope

    # Flatten out strings from send
    flattened = []
    for str in strings
      if Array.isArray str
        flattened = flattened.concat str
      else
        flattened.push str

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
      console.log('joined %s', channel)

      self.receive new EnterMessage(null)

  part: (channel) ->
    self = @
    @bot.part channel, () ->
      console.log('left %s', channel)

      self.receive new LeaveMessage(null)

  getUserFromName: (name) ->
    return @robot.brain.userForName(name) if @robot.brain?.userForName?

    return @userForName name

  getUserFromId: (id) ->
    return @robot.brain.userForId(id) if @robot.brain?.userForId?

    return @userForId id

  createUser: (channel, from) ->
    user = @getUserFromName from
    unless user?
      id = new Date().getTime().toString()
      user = @getUserFromId id
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

    bot.addListener 'message', (from, to, message) ->
      if options.nick.toLowerCase() == to.toLowerCase()
        # this is a private message, let the 'pm' listener handle it
        return

      console.log "From #{from} to #{to}: #{message}"

      user = self.createUser to, from
      if user.room
        console.log "#{to} <#{from}> #{message}"
      else
        unless message.indexOf(to) == 0
          message = "#{to}: #{message}"
        console.log "msg <#{from}> #{message}"

      self.receive new TextMessage(user, message)

    bot.addListener 'action', (from, to, message) ->
      console.log " * From #{from} to #{to}: #{message}"
      user = self.createUser to, from
      if user.room
        console.log "#{to} * #{from} #{message}"
      else
        console.log "msg <#{from}> #{message}"

      self.receive new TextMessage(user, message)

    bot.addListener 'error', (message) ->
      console.error('ERROR: %s: %s', message.command, message.args.join(' '))

    bot.addListener 'pm', (nick, message) ->
      console.log('Got private message from %s: %s', nick, message)

      if process.env.HUBOT_IRC_PRIVATE
        return

      nameLength = options.nick.length
      if message.slice(0, nameLength).toLowerCase() != options.nick.toLowerCase()
        message = "#{options.nick} #{message}"

      self.receive new TextMessage({reply_to: nick, name: nick}, message)

    bot.addListener 'join', (channel, who) ->
      console.log('%s has joined %s', who, channel)
      user = self.createUser channel, who
      self.receive new EnterMessage(user)

    bot.addListener 'part', (channel, who, reason) ->
      console.log('%s has left %s: %s', who, channel, reason)
      user = self.createUser '', who
      self.receive new LeaveMessage(user)

    bot.addListener 'kick', (channel, who, _by, reason) ->
      console.log('%s was kicked from %s by %s: %s', who, channel, _by, reason)

    bot.addListener 'invite', (channel, from) ->
      console.log('%s invite you to join %s', from, channel)

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
