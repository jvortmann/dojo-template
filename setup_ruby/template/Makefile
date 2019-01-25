.PHONY: test watch console login

LANGUAGE := ruby
RUBY_VERSION := [RUBY_VERSION]
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}:${RUBY_VERSION}

test:
	@${DOCKER_RUN} bundle exec rspec

watch:
	@${DOCKER_RUN} bundle exec guard --guardfile ../Guardfile

console:
	@${DOCKER_RUN} irb

login:
	@${DOCKER_RUN} bash
