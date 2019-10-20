-include ../prerequisites.mk

.PHONY: all setup folder_exists build

##>> setup problem with ruby

setup_base := ${CURDIR}
language := ruby
version ?= 2.6.5# default version if unspecified

-include ../tasks_for_language_version.mk

.DEFAULT_GOAL := all

FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/setup" to point to an existing folder")

## all: [default] build docker image and setup problem folder
all: build setup

## setup: setup problem folder
setup: folder_exists ${folder}/lib/ ${folder}/spec/ ${folder}/Makefile ${folder}/.irbrc ${folder}/.ruby-version badge

folder_exists:
	$(if ${folder},,${FOLDER_ERROR})

## build: build docker image
build:
	@echo "Building image for '${language}:${version}' (you can specify the version using: version=${version})"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t dojo/${language}:${version}

${folder}/lib: ${folder}
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/lib ${folder}/

${folder}/spec: ${folder}
	@echo "Setting Test folder"
	@cp -r ${setup_base}/template/spec ${folder}/

${folder}/Makefile: ${folder}
	@echo "Setting Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${folder}/Makefile

${folder}/.irbrc: ${folder}
	@echo "Setting Console config"
	@cp ${setup_base}/template/.irbrc ${folder}/.irbrc

${folder}/.ruby-version: ${folder}
	@echo "Setting ruby version file"
	@echo ${version} > ${folder}/.ruby-version
