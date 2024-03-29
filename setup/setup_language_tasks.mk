.PHONY: all setup folder_exists sources tests console_config dependencies build build_image badge generate_badge

setup_base := ${CURDIR}
image_tag := dojo/${language}:${version}
image_id := $(shell docker images -q ${image_tag})

FOLDER_ERROR = $(error "Folder was not specified. Use 'folder="absolute/path/to/problem/destination" to point to an existing folder")

.DEFAULT_GOAL := all

## all: [default] build docker image and setup problem folder
all: build setup

## setup: setup problem folder
setup: folder_exists sources tests console_config ${folder}/Makefile ${folder}/setup_link ${folder}/.${language}-version ${folder}/.tool-versions badge dependencies

folder_exists: $(if ${folder},,${FOLDER_ERROR})

## build: build docker image
build: $(if $(strip ${image_id}),,build_image)

build_image:
	@echo "Building image for '${image_tag}' (you can specify the version using: version=${version})"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t ${image_tag}

badge: $(if $(shell grep -Es "\[(LANGUAGE|VERSION)\]" ${folder}/README.md),generate_badge,)

generate_badge:
	@echo "Setting ${language} badge"
	@sed -i .bkp -e "s/\\[LANGUAGE\\]/${language}/g" -e "s/\\[VERSION\\]/${version}/g" "${folder}/README.md"
	@rm ${folder}/README.md.bkp

${folder}/.${language}-version:
	@echo "Setting ${language} version file"
	@echo ${version} > ${folder}/.${language}-version

${folder}/.tool-versions:
	@echo "Setting ${language} in tool versions file"
	@echo "${language} ${version}" > ${folder}/.tool-versions

${folder}/Makefile:
	@echo "Setting Makefile"
	@sed -e "s#\\[IMAGE_TAG\\]#${image_tag}#g" \
		-e "s/\\[LANGUAGE\\]/${language}/g" \
		-e "s/\\[VERSION\\]/${version}/g" \
		"${setup_base}/../template/Makefile" > ${folder}/Makefile
	@cat "${setup_base}/template/Makefile" >> ${folder}/Makefile

${folder}/setup_link:
	@ln -sf ../../../setup ${folder}/setup_link
