-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test

run = $(call docker,golang,[VERSION],$(1))

test:
	@$(call run,richgo test -v ./...)
