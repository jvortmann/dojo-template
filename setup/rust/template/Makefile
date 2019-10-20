-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test console

LANGUAGE := rust
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}

## test: run specs
test:
	@${DOCKER_RUN} cargo test

## login: login to the docker image
login:
	@${DOCKER_RUN} bash
