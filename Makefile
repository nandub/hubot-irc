test: coffee-dep js
	@find test -name '*_test.coffee' | xargs -n 1 -t coffee

dev: js
	@coffee -wc --bare -o lib src/

VERSION = $(shell coffee src/npm-version.coffee)
release: npm-dep js
	git commit --allow-empty -a -m "release $(VERSION)"
	git tag v$(VERSION)
	git push origin master
	git push origin v$(VERSION)
	@make remove-js

publish: npm-dep js
	npm publish

install: npm-dep js
	npm install
	@make remove-js

js: coffee-dep
	@coffee -c --bare -o lib src/

remove-js:
	@rm -fr lib/

npm-dep:
	@test `which npm` || echo 'You need npm to do npm install... makes sense?'

coffee-dep:
	@test `which coffee` || echo 'You need to have CoffeeScript in your PATH.\nPlease install it using `brew install coffee-script` or `npm install coffee-script`.'

.PHONY: all

