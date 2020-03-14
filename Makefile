test: coffee-dep js
	@find test -name '*_test.coffee' | xargs -n 1 -t coffee

dev: js
	@coffee -wc --bare -o lib src/

VERSION = $(shell coffee src/npm-version.coffee)
pre-release: bundler-dep
	@bundle install >/dev/null 2>&1
	@sh release/changelog >/dev/null 2>&1
	@sh release/contributors >/dev/null 2>&1

release: yarn-dep js
	git commit --allow-empty -a -m "release $(VERSION)"
	git tag v$(VERSION)
	git push origin master
	git push origin v$(VERSION)
	@make remove-js

publish: yarn-dep js
	npm publish

install: yarn-dep js
	yarn install
	@make remove-js

js: coffee-dep
	@coffee -c --bare -o lib src/

remove-js:
	@rm -fr lib/

bundler-dep:
	@test `which bundle` || echo 'You need bundler to do bundle install... makes sense?'

yarn-dep:
	@test `which yarn` || echo 'You need to have yarn in your PATH.\nPlease install it using `brew install yarn` or `npm install -g yarn`.'

coffee-dep:
	@test `which coffee` || echo 'You need to have coffeescript in your PATH.\nPlease install it using `brew install coffeescript` or `npm install -g coffeescript`.'

.PHONY: all

