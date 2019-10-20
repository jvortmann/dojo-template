.PHONY: login

docker = docker run --rm -it -v ${PWD}:/dojo/problem dojo/$(1):$(2) $(3)

## login: login to the docker image
login:
	@$(call run,bash)
