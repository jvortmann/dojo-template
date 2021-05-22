-include ../prerequisites.mk

##>> setup problem with rust
language := rust
version ?= $(shell grep ${language} ../../.tool-versions | cut -f2 -d' ' | tr -d ' ')

-include ../setup_language_tasks.mk

sources: ${folder}/src
tests: ;
console_config: ;
dependencies: ${folder}/Cargo.toml ${folder}/.gitignore

${folder}/src:
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/src ${folder}/

${folder}/Cargo.toml:
	@echo "Setting Manifest file"
	@cp ${setup_base}/template/Cargo.toml ${folder}/

${folder}/.gitignore:
	@echo "Setting .gitignore file"
	@cp ${setup_base}/template/.gitignore ${folder}/
