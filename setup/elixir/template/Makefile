-include ../../../setup/run_tasks.mk
-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test console

run = $(call docker,elixir,[VERSION],$(1))

## test: run specs
test:
	@$(call run,mix test)

## console: open iex
console:
	@$(call run,iex)
