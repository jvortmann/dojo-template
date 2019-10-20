.PHONY: all setup build badge

setup_base := ${CURDIR}
language := python
version ?= 3.7.4# default version if unspecified

FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/setup" to point to an existing folder")

all: build setup

setup: $(if ${folder},,${FOLDER_ERROR}) ${folder}/dojo.py ${folder}/tests.py ${folder}/Makefile ${folder}/.python-version badge

build:
	@echo "Building image for '${language}:${version}' (you can specify the version using: version=${version})"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t dojo/${language}:${version}

${folder}/dojo.py: ${folder}
	@echo "Create source file"
	@cp ${setup_base}/template/dojo.py ${folder}/

${folder}/tests.py: ${folder}
	@echo "Create tests file"
	@cp ${setup_base}/template/tests.py ${folder}/

${folder}/Makefile: ${folder}
	@echo "Setting Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${folder}/Makefile

${folder}/.python-version: ${folder}
	@echo "Setting python version file"
	@echo ${version} > ${folder}/.python-version

badge: ${folder}/README.md
	@echo "Setting ${language} badge"
	@sed -i bkp -e "s/\\[LANGUAGE\\]/${language}/g" -e "s/\\[VERSION\\]/${version}/g" "${folder}/README.md"

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
