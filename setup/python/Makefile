-include ../prerequisites.mk

##>> setup problem with python
language := python
version ?= $(shell grep ${language} ../../.tool-versions | cut -f2 -d' ' | tr -d ' ')

-include ../setup_language_tasks.mk

sources: ${folder}/dojo.py
tests: ${folder}/tests.py
console_config: ;
dependencies: ${folder}/.gitignore

${folder}/dojo.py:
	@echo "Create source file"
	@cp ${setup_base}/template/dojo.py ${folder}/

${folder}/tests.py:
	@echo "Create tests file"
	@cp ${setup_base}/template/tests.py ${folder}/

${folder}/.gitignore:
	@echo "Setting .gitignore file"
	@cp ${setup_base}/template/.gitignore ${folder}/
