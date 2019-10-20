-include ../prerequisites.mk

##>> setup problem with rust
language := rust
version = 1.38.0# default version if unspecified

-include ../tasks_for_language_version.mk

.PHONY: all setup build badge

sources: ${folder}/src
tests: ;
console_config: ;
dependencies: ${folder}/Cargo.toml

${folder}/src: ${folder}
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/src ${folder}/

${folder}/Cargo.toml: ${folder}
	@echo "Setting Manifest file"
	@cp ${setup_base}/template/Cargo.toml ${folder}/
