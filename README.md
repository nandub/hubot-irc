# Hubot IRC Adapter

NOTICE: I did not created the IRC adapter, just created the NPM package.  Did not intended to take over the adapter I just wanted to use the adapter sooner than later.

## Description

This is the IRC adapter for hubot.

## Installation

* Add `hubot-irc` as a dependency in your hubot's `package.json`
* Install dependencies with `npm install`
* Run hubot with `bin/hubot -a irc`

## Usage

You will need to set some environment variables to use this adapter.

### Heroku

    % heroku config:add HUBOT_IRC_NICK="hubot"

    % heroku config:add HUBOT_IRC_ROOMS="#hubot,#hubot-irc"

    % heroku config:add HUBOT_IRC_SERVER="irc.freenode.net"

### Non-Heroku environment variables

    % export HUBOT_IRC_NICK="hubot"

    % export HUBOT_IRC_ROOMS="#hubot,#hubot-irc"

    % export HUBOT_IRC_SERVER="irc.freenode.net"

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

Copyright &copy; Fernando Ortiz. See LICENSE for details.

