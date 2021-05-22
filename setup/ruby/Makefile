-include ../prerequisites.mk

##>> setup problem with ruby
language := ruby
version ?= $(shell grep ${language} ../../.tool-versions | cut -f2 -d' ' | tr -d ' ')

-include ../setup_language_tasks.mk

sources: ${folder}/lib
tests: ${folder}/spec
console_config: ${folder}/.irbrc
dependencies: ;

${folder}/lib:
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/lib ${folder}/

${folder}/spec:
	@echo "Setting Test folder"
	@cp -r ${setup_base}/template/spec ${folder}/

${folder}/.irbrc:
	@echo "Setting Console config"
	@cp ${setup_base}/template/.irbrc ${folder}/.irbrc
