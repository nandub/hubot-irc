Robot   = require('hubot').Robot
Adapter = require('hubot').Adapter
TextMessage = require('hubot').TextMessage
EnterMessage = require('hubot').EnterMessage
LeaveMessage = require('hubot').LeaveMessage
Response = require('hubot').Response

Irc     = require 'irc'

class IrcBot extends Adapter
  send: (user, strings...) ->
    for str in strings
      if not str?
        continue
      if user.room
        console.log "#{user.room} #{str}"
        @bot.say(user.room, str)
      else if user.name
        console.log "#{user.name} #{str}"
        @bot.say(user.name, str)
      else
        console.log "#{user} #{str}"
        @bot.say(user, str)

  notice: (user, strings...) ->
    for str in strings
      if not str?
        continue
      if user.room
        console.log "notice #{user.room} #{str}"
        @bot.notice(user.room, str)
      else
        console.log "notice #{user.name} #{str}"
        @bot.notice(user.name, str)

  reply: (user, strings...) ->
    for str in strings
      @send user, "#{user.name}: #{str}"

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

  createUser: (channel, from) ->
      user = @userForName from
      unless user?
        id = new Date().getTime().toString()
        user = @userForId id
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
    if not process.env.HUBOT_IRC_NICK or not @robot.name
      throw new Error("HUBOT_IRC_NICK is not defined; try: export HUBOT_IRC_NICK='mybot'")
    else if not process.env.HUBOT_IRC_ROOMS
      throw new Error("HUBOT_IRC_ROOMS is not defined; try: export HUBOT_IRC_ROOMS='#myroom'")
    else if not process.env.HUBOT_IRC_SERVER
      throw new Error("HUBOT_IRC_SERVER is not defined: try: export HUBOT_IRC_SERVER='irc.myserver.com'")

  run: ->
    self = @

    do @checkCanStart

    options =
      nick:     process.env.HUBOT_IRC_NICK or @robot.name
      port:     process.env.HUBOT_IRC_PORT
      rooms:    process.env.HUBOT_IRC_ROOMS.split(",")
      server:   process.env.HUBOT_IRC_SERVER
      password: process.env.HUBOT_IRC_PASSWORD
      nickpass: process.env.HUBOT_IRC_NICKSERV_PASSWORD
      nickusername: process.env.HUBOT_IRC_NICKSERV_USERNAME
      fakessl:  process.env.HUBOT_IRC_SERVER_FAKE_SSL?
      unflood:  process.env.HUBOT_IRC_UNFLOOD?
      debug:    process.env.HUBOT_IRC_DEBUG?
      usessl:   process.env.HUBOT_IRC_USESSL?
      userName: process.env.HUBOT_IRC_USERNAME

    client_options =
      userName: options.userName,
      password: options.password,
      debug: options.debug,
      port: options.port,
      stripColors: true,
      secure: options.usessl,
      selfSigned: options.fakessl,
      floodProtection: options.unflood

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

    bot.addListener 'message', (from, to, message) ->
      console.log "From #{from} to #{to}: #{message}"

      user = self.createUser to, from
      if user.room
        console.log "#{to} <#{from}> #{message}"
      else
        unless message.indexOf(to) == 0
          message = "#{to}: #{message}"
        console.log "msg <#{from}> #{message}"

      self.receive new TextMessage(user, message)

    bot.addListener 'error', (message) ->
        console.error('ERROR: %s: %s', message.command, message.args.join(' '))

    bot.addListener 'pm', (nick, message) ->
        console.log('Got private message from %s: %s', nick, message)

    bot.addListener 'join', (channel, who) ->
        console.log('%s has joined %s', who, channel)
        user = self.createUser channel, who
        self.receive new EnterMessage(user)

    bot.addListener 'part', (channel, who, reason) ->
        console.log('%s has left %s: %s', who, channel, reason)
        user = self.createUser channel, who
        self.receive new LeaveMessage(user)

    bot.addListener 'kick', (channel, who, _by, reason) ->
        console.log('%s was kicked from %s by %s: %s', who, channel, _by, reason)

    bot.addListener 'invite', (channel, from) ->
      console.log('%s invite you to join %s', from, channel)
      bot.join channel

    @bot = bot

    self.emit "connected"

class IrcResponse extends Response
  notice: (strings...) ->
    @robot.adapter.notice @message.user, strings...

exports.use = (robot) ->
  new IrcBot robot
