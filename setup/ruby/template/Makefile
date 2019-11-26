-include ../../../setup/run_tasks.mk
-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test watch console

run = $(call docker,ruby,[VERSION],$(1))

## test: run specs
test:
	@$(call run,bundle exec rspec)

## watch: run specs when files change
watch:
	@$(call run,bundle exec guard --guardfile ../Guardfile --force-polling)

## console: open irb
console:
	@$(call run,irb)
