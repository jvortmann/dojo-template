##>> ruby
context_file = $(word 1,$(abspath $(MAKEFILE_LIST)))
context_name = "dojo"

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

## help: show this list
help: description
	@sed -nE 's/^## (.*): (.*)$$/"\1" "\2"/p' $(context_file) | xargs printf "\033[34m  %-20s\033[0m%s\n"
	@echo

## description: show description
description:
	@sed -nE 's/^##>> (.*)$$/"\1"/p' $(context_file) | xargs printf "\033[37m%-20s\033[0m  \033[33m%-20s\033[0m%s\n" "[$(context_name)]"
