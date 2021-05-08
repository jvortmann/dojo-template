-include ../prerequisites.mk

##>> setup problem with python
language := python
version ?= 3.7.4# default version if unspecified

-include ../setup_language_tasks.mk

sources: ${folder}/dojo.py
tests: ${folder}/tests.py
console_config: ;
dependencies: ${folder}/.gitignore

${folder}/dojo.py: ${folder}
	@echo "Create source file"
	@cp ${setup_base}/template/dojo.py ${folder}/

${folder}/tests.py: ${folder}
	@echo "Create tests file"
	@cp ${setup_base}/template/tests.py ${folder}/

${folder}/.gitignore: ${folder}
	@echo "Setting .gitignore file"
	@cp ${setup_base}/template/.gitignore ${folder}/
