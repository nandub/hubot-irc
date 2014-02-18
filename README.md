# Hubot IRC Adapter

## Travis-CI Build Status

[![Build Status](https://travis-ci.org/nandub/hubot-irc.png?branch=master)](https://travis-ci.org/nandub/hubot-irc)

## Description

This is the IRC adapter for hubot.  For discussion about this adapter, join `#hubot-irc` on `irc.freenode.net`.  For convenience you can [#hubot-irc using webchat.freenode.net/](http://webchat.freenode.net/?channels=hubot-irc&uio=d4)

## Installation and Setup

To get your own hubot up and running we recommend following the [Getting Started](https://github.com/github/hubot/tree/master/docs) directions from the hubot wiki, they are summarized here:

    % npm install -g hubot coffee-script
    % hubot --create myhubot
    % cd myhubot
    % npm install hubot-irc --save && npm install
    % HUBOT_IRC_SERVER=irc.freenode.net \
      HUBOT_IRC_ROOMS="#myhubot-irc" \
      HUBOT_IRC_NICK="myhubot" \
      HUBOT_IRC_UNFLOOD="true" \
      bin/hubot -a irc --name myhubot

**Note**: The default hubot configuration will use a redis based brain that assumes the redis server is already running.  Either start your local redis server (usually with `redis-start &`) or remove the `redis-brain.coffee` script from the default `hubot-scripts.json` file.

## Configuring the Adapter

The IRC adapter requires only the following environment variables.

* `HUBOT_IRC_SERVER`
* `HUBOT_IRC_ROOMS`
* `HUBOT_IRC_NICK`

And the following are optional.

* `HUBOT_IRC_PORT`
* `HUBOT_IRC_PASSWORD`
* `HUBOT_IRC_NICKSERV_PASSWORD`
* `HUBOT_IRC_NICKSERV_USERNAME`
* `HUBOT_IRC_SERVER_FAKE_SSL`
* `HUBOT_IRC_UNFLOOD`
* `HUBOT_IRC_DEBUG`
* `HUBOT_IRC_USESSL`
* `HUBOT_IRC_PRIVATE`

### IRC Server

This is the full hostname or IP address of the IRC server you want your hubot
to connect to. Make a note of it.

### IRC Rooms

This is a comma separated list of the IRC channels you want your hubot to join.
They must include the `#`. Make a note of them. You can join private channels
by simply appending the channel password to the room, e.g. `#private password`.

### IRC Nick

This is the optional nick you want your hubot to join with. If omitted it will
default to the name of your hubot.

### IRC Port

This is the optional port of the IRC server you want your hubot to connect to.
If omitted the default is `6667`. Make a note of it if required.

### IRC Password

This is the optional password of the IRC server you want your hubot to connect
to. If the IRC server doesn't require a password, this can be omitted. Make a
note of it if required.

### IRC Nickserv Password

This is the optional Nickserv password if your hubot is using a nick registered
with Nickserv on the IRC server. Make a note of it if required.

### IRC Nickserv Username

This is the optional Nickserv username if your hubot is using a nick registered
with Nickserv on the IRC server, e.g. `/msg NickServ identify <username> <password>`.

### IRC Server Fake SSL

This is the optional flag if you want to accept self signed SSL certificated
from a non trusted CA. You can set the variable to anything.

### IRC Unflood

This is the optional flag if you want to protect your hubot from flooding
channels with messages. It will queue messages and slowly send. You can set the
variable to any truthy value or a number; if a number is given we will interpret it as
a wait time in milliseconds to use between sending messages.

### IRC Debug

This is the optional flag which will display debug output. You can set the
variable to anything.

### IRC Use SSL

This is the optional flag if your hubot is connecting to an IRC server using
SSL. You can set the variable to anything.

### IRC Private

This is the optional flag if your hubot should ignore `PRIVMSG` and `INVITE`
commands. You can set the variable to anything.

### Configuring the variables on Heroku

    % heroku config:add HUBOT_IRC_SERVER="..."

    % heroku config:add HUBOT_IRC_ROOMS="#foo,#bar"

Optional

    % heroku config:add HUBOT_IRC_NICK="..."

    % heroku config:add HUBOT_IRC_PORT=6767

    % heroku config:add HUBOT_IRC_PASSWORD="..."

    % heroku config:add HUBOT_IRC_NICKSERV_PASSWORD="..."

    % heroku config:add HUBOT_IRC_SERVER_FAKE_SSL="true"

    % heroku config:add HUBOT_IRC_UNFLOOD="true"

    % heroku config:add HUBOT_IRC_DEBUG="true"

    % heroku config:add HUBOT_IRC_USESSL="true"

### Configuring the variables on UNIX

    % export HUBOT_IRC_SERVER="..."

    % export HUBOT_IRC_ROOMS="#foo,#bar"

Optional

    % export HUBOT_IRC_NICK="..."

    % export HUBOT_IRC_PORT=6767

    % export HUBOT_IRC_PASSWORD="..."

    % export HUBOT_IRC_NICKSERV_PASSWORD="..."

    % export HUBOT_IRC_SERVER_FAKE_SSL="true"

    % export HUBOT_IRC_UNFLOOD="true" # Can optionally be passed a number (in milliseconds) that will be used as the delay between messages

    % export HUBOT_IRC_DEBUG="true"

    % export HUBOT_IRC_USESSL="true"

### Configuring the variables on Windows

From Powershell:

    setx HUBOT_IRC_SERVER "..." /m

    setx HUBOT_IRC_ROOMS "#foo,#bar" /m
    
### Testing Local Changes

    gem install foreman
    git clone https://github.com/github/hubot.git
    cd hubot
    # this next line makes a deployable version of the bot for heroku or local deployments
    make package 
    mv hubot/ ../testbot
    cd ../testbot
    - modify package.json to include the version of hubot-irc to test with either an official release or from your local repo
        for an example see this https://gist.github.com/3148311
    - modify Procfile, change adapter (-a option) to "irc" and change the name (-n option) of the bot
    - make sure you followed the usage section from above to set the environment variables (Non-Heroku section)
    foreman start
    
    ...and that is it

## Contribute

Here's the most direct way to get your work merged into the project.

1. Fork the project
2. Clone down your fork
3. Create a feature branch
4. Hack away and add tests, not necessarily in that order
5. Make sure everything still passes by running tests
6. If necessary, rebase your commits into logical chunks without errors
7. Push the branch up to your fork
8. Send a pull request for your branch

## Copyright

Copyright &copy; Fernando Ortiz. MIT License; see LICENSE for further details.

