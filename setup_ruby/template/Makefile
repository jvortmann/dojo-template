.PHONY: test watch console login

DOCKER_RUN = docker run --rm -it -v ${PWD}:/dojo/problem dojo/ruby

test:
	@${DOCKER_RUN} bundle exec rspec

watch:
	@${DOCKER_RUN} bundle exec guard --guardfile ../Guardfile

console:
	@${DOCKER_RUN} irb

login:
	@${DOCKER_RUN} bash
