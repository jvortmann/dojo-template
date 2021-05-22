-include ../prerequisites.mk

##>> setup problem with elixir
language := elixir
version ?= $(shell grep ${language} ../../.tool-versions | cut -f2 -d' ' | tr -d ' ')

-include ../setup_language_tasks.mk

.PHONY: setup_erlang

sources: ${folder}/lib
tests: ${folder}/test
console_config: ;
dependencies: ${folder}/mix.exs

${folder}/lib:
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/lib ${folder}/

${folder}/test:
	@echo "Setting Test folder"
	@cp -r ${setup_base}/template/test ${folder}/

${folder}/mix.exs:
	@echo "Setting depedencies"
	@cp ${setup_base}/template/mix.exs ${folder}/
