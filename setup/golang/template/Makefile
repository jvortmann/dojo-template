-include ../../../setup/prerequisites.mk
-include ../../../setup/run_tasks.mk

##>> tasks

.PHONY: test

run = $(call docker,golang,[VERSION],$(1))

test:
	@$(call run,richgo test -v ./...)
