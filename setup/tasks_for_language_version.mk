.PHONY: all setup folder_exists source_files test_files console_config build badge

setup_base := ${CURDIR}
FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/setup" to point to an existing folder")

.DEFAULT_GOAL := all

## all: [default] build docker image and setup problem folder
all: build setup

## setup: setup problem folder
setup: folder_exists sources tests console_config ${folder}/Makefile ${folder}/.${language}-version badge

folder_exists:
	$(if ${folder},,${FOLDER_ERROR})

## build: build docker image
build:
	@echo "Building image for '${language}:${version}' (you can specify the version using: version=${version})"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t dojo/${language}:${version}

badge: ${folder}/README.md
	@echo "Setting ${language} badge"
	@sed -i .bkp -e "s/\\[LANGUAGE\\]/${language}/g" -e "s/\\[VERSION\\]/${version}/g" "${folder}/README.md"
	@rm ${folder}/README.md.bkp

${folder}/.${language}-version: ${folder}
	@echo "Setting ${language} version file"
	@echo ${version} > ${folder}/.${language}-version

${folder}/Makefile: ${folder}
	@echo "Setting Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${folder}/Makefile
