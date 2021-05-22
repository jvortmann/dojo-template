-include ../prerequisites.mk

##>> setup problem with golang
language := golang
version ?= $(shell grep ${language} ../../.tool-versions | cut -f2 -d' ' | tr -d ' ')
short_version = $(shell echo ${version} | sed -E "s/([[:digit:]]+\.[[:digit:]]+)\..*/\1/")

-include ../setup_language_tasks.mk

sources: ${folder}/main.go
tests: ${folder}/main_test.go;
console_config: ;
dependencies: ${folder}/go.mod;

${folder}/main.go: ${folder}
	@echo "Setting example source file"
	@cp ${setup_base}/template/main.go ${folder}/

${folder}/main_test.go: ${folder}
	@echo "Setting example test file"
	@cp ${setup_base}/template/main_test.go ${folder}/

${folder}/go.mod: ${folder}
	@echo "Setting golang modules"
	@sed -e "s/\\[VERSION\\]/${short_version}/g" "${setup_base}/template/go.mod" > ${folder}/go.mod
