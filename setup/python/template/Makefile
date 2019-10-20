-include ../../../setup/prerequisites.mk
-include ../../../setup/run_tasks.mk

##>> tasks

.PHONY: test console

run = $(call docker,python,[VERSION],$(1))

## test: run specs
test:
	@$(call run,py.test tests.py)

## console: open python console
console:
	@$(call run,python)
