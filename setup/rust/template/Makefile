-include ../../../setup/prerequisites.mk
-include ../../../setup/run_tasks.mk

##>> tasks

.PHONY: test console

run = $(call docker,rust,[VERSION],$(1))

## test: run specs
test:
	@$(call run,cargo test)
