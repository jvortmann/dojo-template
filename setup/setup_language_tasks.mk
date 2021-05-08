.PHONY: all setup folder_exists sources tests console_config dependencies build build_image badge

setup_base := ${CURDIR}
image_tag := dojo/${language}:${version}
image_id := $(shell docker images -q $(image_tag))

FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/setup" to point to an existing folder")

.DEFAULT_GOAL := all

## all: [default] build docker image and setup problem folder
all: build setup

## setup: setup problem folder
setup: folder_exists sources tests console_config ${folder}/Makefile ${folder}/.${language}-version ${folder}/.tool-versions badge dependencies

folder_exists:
	$(if ${folder},,${FOLDER_ERROR})

## build: build docker image
build: $(if $(strip $(image_id)),,build_image)

build_image:
	@echo "Building image for '${image_tag}' (you can specify the version using: version=${version})"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t ${image_tag}

badge: ${folder}/README.md
	@echo "Setting ${language} badge"
	@sed -i .bkp -e "s/\\[LANGUAGE\\]/${language}/g" -e "s/\\[VERSION\\]/${version}/g" "${folder}/README.md"
	@rm ${folder}/README.md.bkp

${folder}/.${language}-version: ${folder}
	@echo "Setting ${language} version file"
	@echo ${version} > ${folder}/.${language}-version

${folder}/.tool-versions: ${folder}
	@echo "Setting ${language} in tools version file"
	@echo "${language} ${version}" > ${folder}/.tool-versions

${folder}/Makefile: ${folder}
	@echo "Setting Makefile"
	@sed -e "s#\\[SETUP_BASE\\]#$(realpath ${setup_base}/../)#g" \
		-e "s#\\[IMAGE_TAG\\]#${image_tag}#g" \
		-e "s/\\[LANGUAGE\\]/${language}/g" \
		-e "s/\\[VERSION\\]/${version}/g" \
		"${setup_base}/../template/Makefile" > ${folder}/Makefile
	@cat "${setup_base}/template/Makefile" >> ${folder}/Makefile
