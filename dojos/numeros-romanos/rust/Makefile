.PHONY: test

LANGUAGE := rust
DOCKER_RUN := docker run --rm -it -v ${PWD}:/dojo/problem dojo/${LANGUAGE}

test:
	@${DOCKER_RUN} cargo test