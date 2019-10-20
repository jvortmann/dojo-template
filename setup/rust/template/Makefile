-include ../../../setup/run_tasks.mk
-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test console

run = $(call docker,rust,[VERSION],$(1))

## test: run specs
test:
	@$(call run,cargo test)
