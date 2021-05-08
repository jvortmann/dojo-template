##>> tasks

.PHONY: test console

## test: run specs
test: build
	@$(call run,py.test tests.py)

## console: open python console
console: build
	@$(call run,python)
