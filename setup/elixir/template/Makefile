##>> tasks

.PHONY: test console

## test: run specs
test: setup_link build
	@$(call run,mix test)

## console: open iex
console: setup_link build
	@$(call run,iex)
