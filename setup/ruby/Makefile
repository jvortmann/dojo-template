.PHONY: all setup build help

setup_base := ${CURDIR}
language := ruby
version ?= 2.6.5# default version if unspecified

FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/setup" to point to an existing folder")

all: build setup

setup: $(if ${folder},,${FOLDER_ERROR}) ${folder}/lib/ ${folder}/spec/ ${folder}/Makefile ${folder}/.irbrc ${folder}/.ruby-version ${folder}/README.md

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

help:
	@echo "Help:"
	@echo
	@echo "Build and Setup:"
	@echo "> make problem='Name of the Problem' version=${version}"
	@echo
	@echo "Build:"
	@echo "> make build version=${version}"
	@echo
	@echo "Setup:"
	@echo "> make setup problem='Name of the Problem'"
