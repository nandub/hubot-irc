
#### [Current]
 * [f0cc4f8](../../commit/f0cc4f8) - __(Jacob Gable)__ Version 0.2.8
 * [bc47ab6](../../commit/bc47ab6) - __(Jacob Gable)__ Merge pull request [#143](../../issues/143) from radnor/patch-1

Fix for [#135](../../issues/135)
 * [951e007](../../commit/951e007) - __(Kevin Lo)__ Fix for [#135](../../issues/135)

Ignore the message if the sender is undefined
 * [07753b4](../../commit/07753b4) - __(Fernando Ortiz)__ change irc dep to 0.3.9
 * [9f35f3e](../../commit/9f35f3e) - __(Fernando Ortiz)__ Merge pull request [#127](../../issues/127) from dpritchett/patch-1

Log all hubot output to debug log?
 * [b0502d0](../../commit/b0502d0) - __(Fernando Ortiz)__ Merge pull request [#137](../../issues/137) from jasonvasquez/log_messages_at_debug_level

Log room messages at the debug level
 * [657ff3c](../../commit/657ff3c) - __(Fernando Ortiz)__ move to latest node-irc
 * [092f488](../../commit/092f488) - __(Fernando Ortiz)__ opps miss the readme
 * [3dd5609](../../commit/3dd5609) - __(Fernando Ortiz)__ change email and license info
 * [09f1f09](../../commit/09f1f09) - __(Jason Vasquez)__ Log room messages at the debug level

It looks like in this singular case, room logs are logged at the info level.  In the default hubot configuration, channel logs are ending up in the hubot log, which may not be desired from a privacy standpoint unless explicitly enabled by changing the log level.
 * [17c5d58](../../commit/17c5d58) - __(Jacob Gable)__ Merge pull request [#130](../../issues/130) from ChristianGaertner/patch-1

Added IRC notifications
 * [470172b](../../commit/470172b) - __(Christian Gärtner)__ Added IRC notifications
 * [d047559](../../commit/d047559) - __(Daniel J. Pritchett)__ Log all hubot output to debug log?

I was hoping to build something on top of hubot's log (a twitter integration) and I noticed that while hubot's logging everything he hears he's not logging everything he says.  If he were logging his own .send() text then I could very easily hook into that.  What do you think?

cc @joshwlewis

btw thanks for this library from #memtech on freenode :beer:
 * [522c501](../../commit/522c501) - __(Jacob Gable)__ release 0.2.7
 * [f91ae1a](../../commit/f91ae1a) - __(Jacob Gable)__ Merge pull request [#124](../../issues/124) from stanaka/fix-notice-multi-lines

Separate lines in case of notice multiple lines
 * [860108f](../../commit/860108f) - __(Shinji Tanaka)__ separate lines in case of notice
 * [bce17c1](../../commit/bce17c1) - __(Jacob Gable)__ release 0.2.6
 * [4046fa4](../../commit/4046fa4) - __(Jacob Gable)__ Merge pull request [#123](../../issues/123) from take-cheeze/leave_msg_fix

Don't enable done flag with text.
 * [c4624a0](../../commit/c4624a0) - __(take_cheeze)__ Don't enable done flag with text. Set text after creating leave message.
 * [2b6177c](../../commit/2b6177c) - __(Jacob Gable)__ release 0.2.5
 * [4e44ce8](../../commit/4e44ce8) - __(Jacob Gable)__ Update npm in before_install instead of before_script
 * [a62ab74](../../commit/a62ab74) - __(Jacob Gable)__ Update version and fix travis

- Bump to 0.2.5
- Update travis config to update NPM to fix minimatch errors

 * [5cf88ab](../../commit/5cf88ab) - __(take_cheeze)__ Pass reason to LeaveMessage.
 * [5677223](../../commit/5677223) - __(take_cheeze)__ Handle quit message.
 * [a31af4e](../../commit/a31af4e) - __(Jacob Gable)__ release 0.2.4
 * [074ba6f](../../commit/074ba6f) - __(Jacob Gable)__ release 0.2.3
 * [6fb02ee](../../commit/6fb02ee) - __(Jacob Gable)__ Merge pull request [#121](../../issues/121) from nandub/fixNotice

Fix notice without from user
 * [72d6b5a](../../commit/72d6b5a) - __(Jacob Gable)__ Fix notice without from user
 * [769e4a4](../../commit/769e4a4) - __(Jacob Gable)__ release 0.2.2
 * [2ab07cc](../../commit/2ab07cc) - __(Jacob Gable)__ Merge pull request [#118](../../issues/118) from nandub/sendPrivate

Add sendPrivate method
 * [d68c642](../../commit/d68c642) - __(Jacob Gable)__ Add sendPrivate method

- Add new IrcResponse class derived from Response
- Add sendPrivate to IrcResponse
- Add sendPrivate to IrcAdapter

 * [cac3074](../../commit/cac3074) - __(Jacob Gable)__ release 0.2.1
 * [8088625](../../commit/8088625) - __(Jacob Gable)__ Merge pull request [#115](../../issues/115) from lusis/logging_fix

change to use proper logger
 * [24d5723](../../commit/24d5723) - __(John E. Vincent)__ change to use proper logger
 * [acb02ce](../../commit/acb02ce) - __(Jacob Gable)__ release 0.2.0
 * [1c7efa1](../../commit/1c7efa1) - __(Jacob Gable)__ release 0.1.28
 * [b376c08](../../commit/b376c08) - __(Jacob Gable)__ Merge pull request [#112](../../issues/112) from patcon/112-irc-nick-as-uid

Save username for both user.name and user.id
 * [24b2d52](../../commit/24b2d52) - __(Patrick Connolly)__ Make smallest possible change to start using irc nick as uid.
 * [ea7a898](../../commit/ea7a898) - __(Jacob Gable)__ release 0.1.27
 * [d401093](../../commit/d401093) - __(Jacob Gable)__ Bump version for publish

[ci skip]

 * [673b8f0](../../commit/673b8f0) - __(Jacob Gable)__ Merge pull request [#111](../../issues/111) from ChristianGaertner/patch-1

Added NOTICE listener
 * [51490cc](../../commit/51490cc) - __(Christian Gärtner)__ Added NOTICE listener
 * [360619b](../../commit/360619b) - __(Jacob Gable)__ Merge pull request [#110](../../issues/110) from colindean/patch-1

Add note about private room passwords
 * [72a7ad3](../../commit/72a7ad3) - __(Colin Dean)__ Add note about private room passwords

Had to look at node-irc to verify this behavior before trying it. Now it's documented.
 * [1417f40](../../commit/1417f40) - __(Jacob Gable)__ release 0.1.26
 * [a57e13c](../../commit/a57e13c) - __(Jacob Gable)__ Bump version for publish
 * [255074d](../../commit/255074d) - __(Jacob Gable)__ Merge pull request [#108](../../issues/108) from justafish/master

Add room information when a user joins/leaves
 * [9cd69bc](../../commit/9cd69bc) - __(Sally Young)__ Add room information when a user joins/leaves
 * [6cf6acd](../../commit/6cf6acd) - __(Jacob Gable)__ release 0.1.25
 * [3c0083f](../../commit/3c0083f) - __(Jacob Gable)__ Bump version for publish
 * [eb71d35](../../commit/eb71d35) - __(Jacob Gable)__ Merge pull request [#106](../../issues/106) from audaxion/ignore_users

Add support for ignoring users
 * [ee2aff8](../../commit/ee2aff8) - __(Robb Wright)__ added ignore in invite listener
 * [6547a19](../../commit/6547a19) - __(Robb Wright)__ fix for empty ignoreUsers array
 * [57b9bb8](../../commit/57b9bb8) - __(Robb Wright)__ Fix ignore users
 * [ad94ede](../../commit/ad94ede) - __(Robb Wright)__ First pass at ignoring users by configuration
 * [0ff5cc5](../../commit/0ff5cc5) - __(Jacob Gable)__ release 0.1.24
 * [29890c9](../../commit/29890c9) - __(Jacob Gable)__ Update version for release
 * [1e6e9b5](../../commit/1e6e9b5) - __(Jacob Gable)__ Merge pull request [#102](../../issues/102) from amaltson/npm-version-of-irc

Use npm version of irc
 * [ea07e41](../../commit/ea07e41) - __(Arthur Maltson)__ Use git https for forked node-irc

This works better behind corporate firewalls

 * [4c7bf47](../../commit/4c7bf47) - __(Jacob Gable)__ release 0.1.23
 * [ed8bfba](../../commit/ed8bfba) - __(Jacob Gable)__ Update version
 * [ab7aac0](../../commit/ab7aac0) - __(Jacob Gable)__ Merge pull request [#101](../../issues/101) from sshirokov/topic

Support changing the topic in the adapter.
 * [decaf4d](../../commit/decaf4d) - __(Yaroslav Shirokov)__ Support changing the topic in the adapter.
 * [ad567c0](../../commit/ad567c0) - __(Jacob Gable)__ release 0.1.22
 * [644af67](../../commit/644af67) - __(Jacob Gable)__ release 0.1.21
 * [ac22b85](../../commit/ac22b85) - __(Jacob Gable)__ Merge pull request [#100](../../issues/100) from rgbkrk/patch-1

Invite grammar
 * [567826e](../../commit/567826e) - __(Kyle Kelley)__ Invite grammar
 * [4ec1905](../../commit/4ec1905) - __(Jacob Gable)__ release 0.1.20
 * [276f1df](../../commit/276f1df) - __(Jacob Gable)__ Merge pull request [#98](../../issues/98) from 5thWall/bug/joinpart

Pass user to Leave and Enter Message constructors
 * [637effc](../../commit/637effc) - __(Andy)__ Pass user to Leave and Enter Message constructors
 * [f5b5496](../../commit/f5b5496) - __(Fernando Ortiz)__ add bundler-dep
 * [29da22e](../../commit/29da22e) - __(Fernando Ortiz)__ in case @jgable does not use ruby I don't force to pre-release in release task
 * [5a9f3f8](../../commit/5a9f3f8) - __(Fernando Ortiz)__ add changelog and contributors
 * [6ea6ea1](../../commit/6ea6ea1) - __(Fernando Ortiz)__ add contributors script
 * [569e7e5](../../commit/569e7e5) - __(Jacob Gable)__ release 0.1.19
 * [1020a0f](../../commit/1020a0f) - __(Jacob Gable)__ Bump version for npm publish
 * [36a46c4](../../commit/36a46c4) - __(Jacob Gable)__ Merge pull request [#94](../../issues/94) from VShell/feature/ignore-invites

Add environment variable to ignore invites
 * [af24bfe](../../commit/af24bfe) - __(Cameron Turner)__ Ignore /invites when the HUBOT_IRC_IGNOREINVITE environment variable is set
 * [f3b7d13](../../commit/f3b7d13) - __(Fernando Ortiz)__ Change Build Status heading size
 * [81273e7](../../commit/81273e7) - __(Fernando Ortiz)__ Add Travis-CI build status
 * [d25378a](../../commit/d25378a) - __(Jacob Gable)__ release 0.1.18
 * [efa007d](../../commit/efa007d) - __(Jacob Gable)__ Add Gruntfile.coffee to linting and add travis file
 * [5a4a72c](../../commit/5a4a72c) - __(Jacob Gable)__ Merge pull request [#92](../../issues/92) from halkeye/action-event

Trigger TextMessage when actions are done
 * [9d4e431](../../commit/9d4e431) - __(Jacob Gable)__ Merge pull request [#91](../../issues/91) from halkeye/add-action-support

Add emote support
 * [f255884](../../commit/f255884) - __(Fernando Ortiz)__ add webchat link to connect to #hubot-irc channel.
 * [bd5f99b](../../commit/bd5f99b) - __(Fernando Ortiz)__ Revert "Revert "add mibbit.com link to connect to #hubot-irc channel""

This reverts commit 95058fd6051afaa0c954a60af42008ec2bacb039.

 * [b42caf3](../../commit/b42caf3) - __(Gavin)__ Trigger TextMessage when actions are done
 * [f98db8e](../../commit/f98db8e) - __(Gavin)__ Add emote support
 * [95058fd](../../commit/95058fd) - __(Fernando Ortiz)__ Revert "add mibbit.com link to connect to #hubot-irc channel"

Sad freenode does not support mibbit.com.  This reverts commit 04ec0b5f2587fba0f8d06801e9b8eebe23382d0a.

 * [04ec0b5](../../commit/04ec0b5) - __(Fernando Ortiz)__ add mibbit.com link to connect to #hubot-irc channel
 * [f20066f](../../commit/f20066f) - __(Jacob Gable)__ Merge pull request [#90](../../issues/90) from stephenyeargin/master

Updates README to include reference to HUBOT_IRC_PRIVATE env variable
 * [0dc3b86](../../commit/0dc3b86) - __(Stephen Yeargin)__ Describe the variable's purpose
 * [79c128d](../../commit/79c128d) - __(Stephen Yeargin)__ Updates README to include reference to HUBOT_IRC_PRIVATE env variable
 * [b50d74f](../../commit/b50d74f) - __(Jacob Gable)__ Merge pull request [#88](../../issues/88) from halkeye/fix-lint-issue

remove trailing space
 * [76afce0](../../commit/76afce0) - __(Gavin)__ remove trailing space (issue reported by grunt)
 * [ef7ef14](../../commit/ef7ef14) - __(Jacob Gable)__ Update README to include info from Hubot wiki

Closes [#87](../../issues/87).

 * [85e42c5](../../commit/85e42c5) - __(Jacob Gable)__ release 0.1.17
 * [3653c2b](../../commit/3653c2b) - __(Jacob Gable)__ Fix error for getUserForId
 * [8df1ea1](../../commit/8df1ea1) - __(Jacob Gable)__ release 0.1.16
 * [4895b20](../../commit/4895b20) - __(Jacob Gable)__ Bump version for npm publish
 * [a7ac686](../../commit/a7ac686) - __(Jacob Gable)__ Merge pull request [#86](../../issues/86) from pgolm/feature/fix-unflood

fix new unflood options
 * [443f258](../../commit/443f258) - __(Peter Golm)__ refactor unflood improvements
 * [4d10cfa](../../commit/4d10cfa) - __(Fernando Ortiz)__ add local fork of node-irc to fix ssl problem on node 0.9+, it fixes [#76](../../issues/76) or until upstream fixes the problem.
 * [d5ad864](../../commit/d5ad864) - __(Peter Golm)__ fix unflood options parse
 * [54bcfa3](../../commit/54bcfa3) - __(Jacob Gable)__ Merge pull request [#84](../../issues/84) from nandub/feature/enable-grunt

Enable Grunt
 * [0e3ee5c](../../commit/0e3ee5c) - __(Fernando Ortiz)__ fix indentation and add grunt-coffeelint
 * [5ffe304](../../commit/5ffe304) - __(Jacob Gable)__ release 0.1.15
 * [d3eab32](../../commit/d3eab32) - __(Fernando Ortiz)__ Merge pull request [#83](../../issues/83) from ewilliam/master

Fix typo
 * [a1ac90e](../../commit/a1ac90e) - __(William Albright)__ fix typo
 * [07122c7](../../commit/07122c7) - __(Jacob Gable)__ release 0.1.14
 * [64b36a0](../../commit/64b36a0) - __(Jacob Gable)__ Merge pull request [#82](../../issues/82) from torp/Fix-userForId

Fix for the deprecation of `userForId()`
 * [c269660](../../commit/c269660) - __(kingcody)__ Fix for the depreciation of userForId()

#### 0.1.14
 * [5879e1a](../../commit/5879e1a) - __(Jacob Gable)__ release 0.1.14
 * [1ebd702](../../commit/1ebd702) - __(Jacob Gable)__ release 0.1.13
 * [b18e613](../../commit/b18e613) - __(Robb Wright)__ Fix for deprecation warning
 * [0159129](../../commit/0159129) - __(Fernando Ortiz)__ Merge pull request [#79](../../issues/79) from parkr/unflood-plus

New unflood options
 * [cd1434e](../../commit/cd1434e) - __(Parker Moore)__ New unflood options, per nandub/hubot-irc[#77](../../issues/77).
 * [979ed77](../../commit/979ed77) - __(Jacob Gable)__ release 0.1.12
 * [55c95ea](../../commit/55c95ea) - __(Jacob Gable)__ Merging and fixing notice problems
 * [378fc4c](../../commit/378fc4c) - __(Josh Betz)__ Considerations for private bots

If I run my bot in a public place, like freenode, I want to be able to control exactly what rooms it joins.

Just walking into any room someone invites him into and talking with strangers is bad :)
 * [9a140ff](../../commit/9a140ff) - __(Christopher Kim)__ Added option to execute additional command after connecting
 * [b4b07d0](../../commit/b4b07d0) - __(Jacob Gable)__ release 0.1.11
 * [9468c79](../../commit/9468c79) - __(Jacob Gable)__ release 0.1.11
 * [83153d8](../../commit/83153d8) - __(Jacob Gable)__ Bump version for npm publish
 * [411f15f](../../commit/411f15f) - __(Jacob Gable)__ Merge pull request [#69](../../issues/69) from suisho/notice_mode

Add send notice mode
 * [7944bf8](../../commit/7944bf8) - __(suisho)__ move out if statement
 * [670c877](../../commit/670c877) - __(suisho)__ Add send notice mode
 * [2fb12f7](../../commit/2fb12f7) - __(Jacob Gable)__ release 0.1.10
 * [7299997](../../commit/7299997) - __(Jacob Gable)__ release 0.1.10
 * [183b95c](../../commit/183b95c) - __(Jacob Gable)__ Bumping version for publish
 * [abbc282](../../commit/abbc282) - __(Jacob Gable)__ Merge pull request [#66](../../issues/66) from theodi/master

Clear user.room when a user leaves the channel
 * [0989308](../../commit/0989308) - __(James Smith)__ clear room when user leaves the channel
 * [57ec2ec](../../commit/57ec2ec) - __(Jacob Gable)__ Add link to runnable hubot project
 * [d62c9ec](../../commit/d62c9ec) - __(Jacob Gable)__ release 0.1.9
 * [ea353aa](../../commit/ea353aa) - __(Jacob Gable)__ Merge pull request [#65](../../issues/65) from frozzare/patch-1

Updated irc to 0.3.6
 * [b8d7825](../../commit/b8d7825) - __(Jacob Gable)__ Merge pull request [#64](../../issues/64) from hashbrowncipher/pm_once

Handle PMs once, rather than twice.
 * [4b4b72a](../../commit/4b4b72a) - __(Fredrik Forsmo)__ Updated irc to 0.3.6

0.3.6 fixes parse line errors, so it don't split "hello :)" to ":hello".
 * [6b03654](../../commit/6b03654) - __(Josh Snyder)__ Handle PMs once, rather than twice.

Currently new PMs are handled first by the 'message' handler and then by the
'pm' handler.  This change makes the 'message' handler take a back seat to the
'pm' handler.

 * [e5accaa](../../commit/e5accaa) - __(Jacob Gable)__ release 0.1.8
 * [977248d](../../commit/977248d) - __(Jacob Gable)__ Merge pull request [#63](../../issues/63) from suisho/robot_name

Check true when robot.name is exist
 * [ab310f5](../../commit/ab310f5) - __(suisho)__ Check true when robot.name is exist
 * [97ad32f](../../commit/97ad32f) - __(Jacob Gable)__ release 0.1.7
 * [f21984f](../../commit/f21984f) - __(Jacob Gable)__ release 0.1.6
 * [25e34c6](../../commit/25e34c6) - __(Jacob Gable)__ Automatically put name in received private messages, fixes [#61](../../issues/61)
 * [64413c4](../../commit/64413c4) - __(Jacob Gable)__ release 0.1.6
 * [2bd1ddd](../../commit/2bd1ddd) - __(Jacob Gable)__ Merge pull request [#60](../../issues/60) from petecheslock/master

Update package.json to install node-irc 0.3.5
 * [2a4688f](../../commit/2a4688f) - __(Pete Cheslock)__ Update to node-irc 0.3.5
 * [1155527](../../commit/1155527) - __(Jacob Gable)__ release 0.1.5
 * [615f99d](../../commit/615f99d) - __(Jacob Gable)__ Bumping version for npm release
 * [54df5a9](../../commit/54df5a9) - __(Jacob Gable)__ Refactoring send for envelope & receiving private messages
 * [91c79e3](../../commit/91c79e3) - __(Jacob Gable)__ Merge pull request [#58](../../issues/58) from EverythingMe/master

When entering a channel, invoke self.createUser for all users
 * [27d391e](../../commit/27d391e) - __(Jacob Gable)__ Merge pull request [#57](../../issues/57) from fmitchell/master

Fix messages with new Adapter format
 * [77584e0](../../commit/77584e0) - __(Omri Bahumi)__ When entering a channel, invoke self.createUser for all users
 * [09cd6e2](../../commit/09cd6e2) - __(fmitchell)__ fix messages with new adapter format
 * [48cc137](../../commit/48cc137) - __(Jacob Gable)__ release 0.1.4
 * [fbeeda4](../../commit/fbeeda4) - __(Jacob Gable)__ Merge pull request [#50](../../issues/50) from johnmichel/master

Adding Real Name as an configurable variable
 * [83a7848](../../commit/83a7848) - __(John Michel)__ Adding Real Name as an environmental variable

Useful for networks where the Real Name of a bot must correspond to a
non-bot user

 * [3e45fc1](../../commit/3e45fc1) - __(Jacob Gable)__ release 0.1.3
 * [f3ae1a3](../../commit/f3ae1a3) - __(Jacob Gable)__ Adding d to certExpire
 * [f25a7ac](../../commit/f25a7ac) - __(Jacob Gable)__ Cleaning up hubot dependencies, fixing certExpired in options
 * [01b21f6](../../commit/01b21f6) - __(Jacob Gable)__ Updating README installation and setup directions
 * [d92edf4](../../commit/d92edf4) - __(Jacob Gable)__ release 0.1.2
 * [c12405b](../../commit/c12405b) - __(Jacob Gable)__ Fixes [#48](../../issues/48), [#49](../../issues/49).  Bump irc module version, allow expiredCert option
 * [381abba](../../commit/381abba) - __(Jacob Gable)__ release 0.1.1
 * [6b992d0](../../commit/6b992d0) - __(Jacob Gable)__ release 0.1.0
 * [2d3dfa5](../../commit/2d3dfa5) - __(Jacob Gable)__ Merge pull request [#47](../../issues/47) from saebekassebil/master

Fix NickServ IDENTIFY messages for irc.mozilla.org - Fixes [#46](../../issues/46)
 * [6cef98f](../../commit/6cef98f) - __(Saebekassebil)__ Fix irc.mozilla.org login (and probably others)
 * [57bfa43](../../commit/57bfa43) - __(Jacob Gable)__ Merge pull request [#42](../../issues/42) from BotDev/userid-fix

Tweaked user ID generation.
 * [04eb38e](../../commit/04eb38e) - __(BotDev)__ Tweaked user ID generation.
 * [3cac371](../../commit/3cac371) - __(Jacob Gable)__ Merge pull request [#40](../../issues/40) from jamesob/nickserv_username

Optional username for NickServ `identify`
 * [49dafb5](../../commit/49dafb5) - __(James O'Beirne)__ listen for 'identify' notice instead of 'register': more generic
 * [2ce86eb](../../commit/2ce86eb) - __(James O'Beirne)__ support a distinct username for NickServ identify msgs
 * [30b87df](../../commit/30b87df) - __(Fernando Ortiz)__ Add "Test Local Changes" section

Closes [#36](../../issues/36)
 * [588906d](../../commit/588906d) - __(Jacob Gable)__ Updating min version in notice about adapter upgrade.
 * [aa2a257](../../commit/aa2a257) - __(Jacob Gable)__ Adding information about hubot-irc channel on freenode.
 * [175feb3](../../commit/175feb3) - __(Jacob Gable)__ Adding year and name to LICENSE (fixes [#33](../../issues/33)) and updating warning in README (fixes [#32](../../issues/32))
 * [afb8779](../../commit/afb8779) - __(Jacob Gable)__ release 0.1.0
 * [7822ba5](../../commit/7822ba5) - __(Jacob Gable)__ Merging fix for NICK check and setting bots name so it responds to its own name
 * [2b0dbb9](../../commit/2b0dbb9) - __(Jacob Gable)__ Updating the robots name with the passed in nick so it responds to its name
 * [e1c693f](../../commit/e1c693f) - __(Fernando Ortiz)__ Fix Error: HUBOT_IRC_NICK is not defined; try: export HUBOT_IRC_NICK='mybot'
 * [bea8006](../../commit/bea8006) - __(Jacob Gable)__ Removing duplicate code from earlier merge
 * [a6fc4a0](../../commit/a6fc4a0) - __(Jacob Gable)__ Adding some helpful errors for missing environment variables
 * [f4b0f82](../../commit/f4b0f82) - __(Jacob Gable)__ Merging changes from @intridea-east for showing name before message
 * [c730c7e](../../commit/c730c7e) - __(Jacob Gable)__ Merge pull request [#13](../../issues/13) from simon/irc-room

Send messages to rooms
 * [2eb232c](../../commit/2eb232c) - __(Jacob Gable)__ Updates before merging @pboos changes
 * [5e877a5](../../commit/5e877a5) - __(Jacob Gable)__ Adding changes for entering and leaving room from @pboos
 * [3a3cf72](../../commit/3a3cf72) - __(Jacob Gable)__ Updating version information, description to Hubot 2.0 and updating node engine upper version
 * [ed5cd41](../../commit/ed5cd41) - __(Jacob Gable)__ Merge pull request [#31](../../issues/31) from elliotttf/master

Updates for latest version of hubot
 * [0343013](../../commit/0343013) - __(Elliott Foster)__ More correct implementation for join/leave messages for the bot.
 * [9159d28](../../commit/9159d28) - __(Elliott Foster)__ Use enter/leave messages on enter/leave events.
 * [8d33bdd](../../commit/8d33bdd) - __(Elliott Foster)__ Missed one.
 * [a54b89d](../../commit/a54b89d) - __(Elliott Foster)__ Updating to work with latest hubot.
 * [29700cd](../../commit/29700cd) - __(Patrick Boos)__ Added robot.leave support
 * [dc0b0e6](../../commit/dc0b0e6) - __(Patrick Boos)__ Added support for "Enter Message" support
 * [4b39ced](../../commit/4b39ced) - __(Elliott Foster)__ Emit a joined event.
 * [d8ab884](../../commit/d8ab884) - __(Elliott Foster)__ Pass command arguments all toghether.
 * [a75a006](../../commit/a75a006) - __(Elliott Foster)__ Adding a command listener.
 * [9ac1fd9](../../commit/9ac1fd9) - __(Fernando Ortiz)__ release 0.0.8
 * [0b859bc](../../commit/0b859bc) - __(Fernando Ortiz)__ change HUBOT_IRC_USERNAME? to HUBOT_IRC_USERNAME
 * [a4c7262](../../commit/a4c7262) - __(Fernando Ortiz)__ Merge pull request [#17](../../issues/17) from Schnitz/master

allow for better user identification for some IRC networks
 * [61d8985](../../commit/61d8985) - __(Fabian Frank)__ using options object for consistency

using options object for consistency, thanks jimeh for the suggestion.

 * [a42b694](../../commit/a42b694) - __(Fernando Ortiz)__ release 0.0.7
 * [97ec0ef](../../commit/97ec0ef) - __(Fernando Ortiz)__ Closes [#16](../../issues/16), [#18](../../issues/18)

Signed-off-by: Fernando Ortiz <fortiz2k@gmail.com>

 * [40c0243](../../commit/40c0243) - __(Ian Anderson)__ Run now emits "connected" event in order to load hubot scripts

Signed-off-by: Ian Anderson <getfatday@gmail.com>

 * [2529236](../../commit/2529236) - __(Fabian Frank)__ hubot is identifying itself as user@host to the IRC server. making the user portion configurable as HUBOT_IRC_USERNAME, since certain IRC networks require a valid username instead of the default one, which is nodebot.
 * [68c35fe](../../commit/68c35fe) - __(kmnk)__ append on constructor
 * [df2a032](../../commit/df2a032) - __(kmnk)__ append notice method to Adapter and Robot.Response
 * [43c2061](../../commit/43c2061) - __(Simon Gate)__ Send messages to rooms
 * [88a44a3](../../commit/88a44a3) - __(Ian Yang)__ Auto add name before message which sent from query window
 * [a1ee96d](../../commit/a1ee96d) - __(Fernando Ortiz)__ release 0.0.6
 * [ae3e556](../../commit/ae3e556) - __(Tom Bell)__ Merge pull request [#7](../../issues/7) from DataDog/null_send

fix for [#5](../../issues/5): hard crash on sending null values
 * [2913a4d](../../commit/2913a4d) - __(Matt Singleton)__ fix for [#5](../../issues/5): hard crash on sending null values
 * [8bc9843](../../commit/8bc9843) - __(Tom Bell)__ Remove the Twilio specific config
 * [d536c04](../../commit/d536c04) - __(Fernando Ortiz)__ release 0.0.5
 * [4a5f0bd](../../commit/4a5f0bd) - __(Tom Bell)__ Remove hubot dependency as hubot will already be installed, fixes [#4](../../issues/4)
 * [8534138](../../commit/8534138) - __(Fernando Ortiz)__ release 0.0.4
 * [2693d5a](../../commit/2693d5a) - __(Tom Bell)__ Merge pull request [#3](../../issues/3) from mrtazz/fix-freenode-room-join

fix room join for freenode channels
 * [e2df065](../../commit/e2df065) - __(Daniel Schauenberg)__ fix room join for freenode channels

I had this problem that hubot wouldn't join rooms and just idled connected to
the freenode servers. I tracked it down to the `NOTICE` message parsing. The
freenode servers would not send 'Password accepted' but rather something like
'You are now identified for ...'. I added a condition to take that into
account.

 * [03638b0](../../commit/03638b0) - __(Fernando Ortiz)__ release 0.0.3
 * [ef51441](../../commit/ef51441) - __(Fernando Ortiz)__ release 0.0.2
 * [88f9ae3](../../commit/88f9ae3) - __(Fernando Ortiz)__ release 0.0.2
 * [95f42ec](../../commit/95f42ec) - __(Fernando Ortiz)__ first commit
