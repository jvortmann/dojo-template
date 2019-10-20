-include ../../../setup/prerequisites.mk

##>> tasks

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
