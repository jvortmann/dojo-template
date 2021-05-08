##>> tasks

.PHONY: test watch console

## test: run specs
test: build
	@$(call run,bundle exec rspec)

## watch: run specs when files change
watch: build
	@$(call run,bundle exec guard --guardfile ../Guardfile --force-polling)

## console: open irb
console: build
	@$(call run,irb)
