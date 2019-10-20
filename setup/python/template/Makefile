##>> python
context_file = $(word 1,$(abspath $(MAKEFILE_LIST)))
context_name = "dojo"

.PHONY: test console

LANGUAGE := python
VERSION := [VERSION]
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}:${VERSION}

## test: run specs
test:
	@${DOCKER_RUN} py.test tests.py

## console: open python console
console:
	@${DOCKER_RUN} python

## help: show this list
help: description
	@sed -nE 's/^## (.*): (.*)$$/"\1" "\2"/p' $(context_file) | xargs printf "\033[34m  %-20s\033[0m%s\n"
	@echo

## description: show description
description:
	@sed -nE 's/^##>> (.*)$$/"\1"/p' $(context_file) | xargs printf "\033[37m%-20s\033[0m  \033[33m%-20s\033[0m%s\n" "[$(context_name)]"
