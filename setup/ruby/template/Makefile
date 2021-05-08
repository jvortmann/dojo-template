##>> tasks

.PHONY: test watch console

## test: run specs
test: setup_link build
	@$(call run,bundle exec rspec)

## watch: run specs when files change
watch: setup_link build
	@$(call run,bundle exec guard --guardfile ../Guardfile --force-polling)

## console: open irb
console: setup_link build
	@$(call run,irb)
