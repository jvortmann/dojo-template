-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test watch console login

LANGUAGE := ruby
VERSION := [VERSION]
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}:${VERSION}

## test: run specs
test:
	@${DOCKER_RUN} bundle exec rspec

## watch: run specs when files change
watch:
	@${DOCKER_RUN} bundle exec guard --guardfile ../Guardfile

## console: open irb
console:
	@${DOCKER_RUN} irb

## login: login to the docker image
login:
	@${DOCKER_RUN} bash
