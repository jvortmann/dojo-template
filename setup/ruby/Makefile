-include ../prerequisites.mk

##>> setup problem with ruby
language := ruby
version ?= 2.6.5# default version if unspecified

-include ../setup_language_tasks.mk

sources: ${folder}/lib
tests: ${folder}/spec
console_config: ${folder}/.irbrc
dependencies: ;

${folder}/lib: ${folder}
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/lib ${folder}/

${folder}/spec: ${folder}
	@echo "Setting Test folder"
	@cp -r ${setup_base}/template/spec ${folder}/

${folder}/.irbrc: ${folder}
	@echo "Setting Console config"
	@cp ${setup_base}/template/.irbrc ${folder}/.irbrc
