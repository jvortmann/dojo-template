-include [SETUP_BASE]/run_tasks.mk
-include [SETUP_BASE]/prerequisites.mk

setup_base := [SETUP_BASE]
image_tag := [IMAGE_TAG]
image_id := $(shell docker images -q $(image_tag))
run = $(call docker,[LANGUAGE],[VERSION],$(1))

.PHONY: build build_image

## build: build docker image
build: $(if $(strip $(image_id)),,build_image)

build_image:
	@echo "Building image for '${image_tag}'"
	@docker build ${setup_base}/build --build-arg VERSION=[VERSION] -t ${image_tag}

