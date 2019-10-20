.PHONY: all setup build help

setup_base := ${CURDIR}
language := rust
version = 1.38.0# default version if unspecified

FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/setup" to point to an existing folder")

all: build setup

setup: $(if ${folder},,${FOLDER_ERROR}) ${folder}/src/ ${folder}/Makefile ${folder}/.rust-version ${folder}/Cargo.toml ${folder}/README.md 

build:
	@echo "Building image for '${language}:${version}'"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t dojo/${language}:${version}

${folder}/src: ${folder}
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/src ${folder}/

${folder}/Makefile: ${folder}
	@echo "Setting Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${folder}/Makefile

${folder}/.rust-version: ${folder}
	@echo "Setting rust version file"
	@echo ${version} > ${folder}/.rust-version

${folder}/Cargo.toml: ${folder}
	@echo "Setting Manifest file"
	@cp ${setup_base}/template/Cargo.toml ${folder}/

${folder}/README.md: ${folder}
	@echo "Setting Readme"
	@sed "s#\\[DATA\\]#$(shell date "+%Y-%m-%d %H:%M:%S")#g" "${setup_base}/template/README.md" | \
	sed "s#\\[PROBLEM\\]#${problem}#g" | \
	sed "s#\\[VERSION\\]#${version}#g" | \
	sed "s#\\[URL\\]#${url}#g" > \
	"${folder}/README.md"

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
