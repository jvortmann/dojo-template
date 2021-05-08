##>> tasks

.PHONY: test watch console

## test: run specs
test: run_dependencies
	@$(call run,bundle exec rspec)

## watch: run specs when files change
watch: run_dependencies
	@$(call run,bundle exec guard --guardfile ../Guardfile --force-polling)

## console: open irb
console: run_dependencies
	@$(call run,irb)
