context_file = $(word 1,$(abspath $(MAKEFILE_LIST)))
prerequisites_file = $(word 2,$(abspath $(MAKEFILE_LIST)))
context_name = $(shell echo $(dir $(context_file)) | sed -E "s/^.*dojos\/(.*)\/(.*)\/$$/\2/")

.PHONY: help description
.DEFAULT_GOAL := help

docker = docker run --rm -it -v ${PWD}:/dojo/problem dojo/$(1):$(2) $(3)

## help: show this list
help: description
	@sed -nE 's/^## (.*): (.*)$$/"\1" "\2"/p' $(context_file) $(prerequisites_file) | xargs printf "\033[34m  %-20s\033[0m%s\n"
	@echo

## description: show description
description:
	@sed -nE 's/^##>> (.*)$$/"\1"/p' $(context_file) | xargs printf "\033[37m%-20s\033[0m  \033[33m%-20s\033[0m%s\n" "[$(context_name)]"
