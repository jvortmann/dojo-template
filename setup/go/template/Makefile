.PHONY: test

LANGUAGE := go
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}

test:
	@${DOCKER_RUN} richgo test -v ./...
