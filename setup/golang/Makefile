.PHONY: all setup build

setup_base := ${CURDIR}
language := golang
version ?= 1.13.3# default version if unspecified

FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/setup" to point to an existing folder")

all: build setup

setup: $(if ${folder},,${FOLDER_ERROR}) ${folder}/main.go ${folder}/main_test.go ${folder}/Makefile ${folder}/.${language}-version

build:
	@echo "Building image for '${language}:${version}' (you can specify the version using: version=${version})"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t dojo/${language}:${version}

${folder}/main.go: ${folder}
	@echo "Setting example source file"
	@cp ${setup_base}/template/main.go ${folder}/

${folder}/main_test.go: ${folder}
	@echo "Setting example test file"
	@cp ${setup_base}/template/main_test.go ${folder}/

${folder}/Makefile: ${folder}
	@echo "Creating Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${folder}/Makefile

${folder}/.${language}-version: ${folder}
	@echo "Setting ${language} version file"
	@echo ${version} > ${folder}/.${language}-version

help:
	@echo "Help:"
	@echo
	@echo "Build and Setup:"
	@echo "> make problem='Name of the Problem'"
	@echo
	@echo "Build:"
	@echo "> make build"
	@echo
	@echo "Setup:"
	@echo "> make setup problem='Name of the Problem'"
