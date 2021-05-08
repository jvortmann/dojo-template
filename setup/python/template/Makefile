##>> tasks

.PHONY: test console

## test: run specs
test: setup_link build
	@$(call run,py.test tests.py)

## console: open python console
console: setup_link build
	@$(call run,python)
