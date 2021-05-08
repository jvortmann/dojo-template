##>> tasks

.PHONY: test console

## test: run specs
test: run_dependencies
	@$(call run,py.test tests.py)

## console: open python console
console: run_dependencies
	@$(call run,python)
