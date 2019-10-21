-include ../../../setup/run_tasks.mk
-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test

run = $(call docker,rust,[VERSION],$(1))

## test: run specs
test:
	@$(call run,cargo test)
