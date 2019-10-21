-include ../prerequisites.mk

##>> setup problem with golang
language := golang
version ?= 1.13.3# default version if unspecified

-include ../tasks_for_language_version.mk

sources: ${folder}/main.go
tests: ${folder}/main_test.go;
console_config: ;
dependencies:  ;

${folder}/main.go: ${folder}
	@echo "Setting example source file"
	@cp ${setup_base}/template/main.go ${folder}/

${folder}/main_test.go: ${folder}
	@echo "Setting example test file"
	@cp ${setup_base}/template/main_test.go ${folder}/
