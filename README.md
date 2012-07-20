# Hubot IRC Adapter

## Description

This is the IRC adapter for hubot.  For discussion about this adapter, join `#hubot-irc` on `irc.freenode.net`.

## Installation

NOTICE: This bot is now upgraded to Hubot 2.3.  You should specify 0.0.8 as your hubot-irc dependency for older versions of Hubot (<2.3.0).

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

