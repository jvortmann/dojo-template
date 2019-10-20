-include ../../../setup/prerequisites.mk

##>> tasks

.PHONY: test watch console login

run = $(call docker,ruby,[VERSION],$(1))

## test: run specs
test:
	@$(call run,bundle exec rspec)

## watch: run specs when files change
watch:
	@$(call run,bundle exec guard --guardfile ../Guardfile)

## console: open irb
console:
	@$(call run,irb)
