.PHONY: test console

LANGUAGE := python
PYTHON_VERSION := 3.7.2
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}:${PYTHON_VERSION}

test:
	@${DOCKER_RUN} py.test tests.py

console:
	@${DOCKER_RUN} python
