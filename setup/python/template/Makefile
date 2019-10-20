.PHONY: test console

LANGUAGE := python
VERSION := [VERSION]
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}:${VERSION}

test:
	@${DOCKER_RUN} py.test tests.py

console:
	@${DOCKER_RUN} python
