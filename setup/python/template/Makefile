.PHONY: test console

LANGUAGE := python
PYTHON_VERSION := [PYTHON_VERSION]
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}:${PYTHON_VERSION}

test:
	@${DOCKER_RUN} py.test tests.py

console:
	@${DOCKER_RUN} python
