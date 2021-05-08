context_file = $(word 1,$(abspath $(MAKEFILE_LIST)))
tasks_files = $(abspath $(MAKEFILE_LIST))
context_name = $(shell echo $(dir $(context_file)) | sed -E "s/^.*\/(.*)\/(.*)\/$$/\1 - \2/")

.PHONY: help description
.DEFAULT_GOAL := help

## help: show this list
help: description
	@sed -nE 's/^## (.*): (.*)$$/"\1" "\2"/p' $(tasks_files) | xargs printf "\033[34m  %-20s\033[0m%s\n"
	@echo

## description: show description
description:
	@sed -nE 's/^##>> (.*)$$/"\1"/p' $(context_file) | xargs printf "\033[37m%-20s\033[0m  \033[33m%-20s\033[0m%s\n" "[$(context_name)]"
