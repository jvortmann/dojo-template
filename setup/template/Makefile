-include setup_link/run_tasks.mk
-include setup_link/prerequisites.mk

setup_base := setup_link
image_tag := [IMAGE_TAG]
image_id := $(shell docker images -q $(image_tag))
run = $(call docker,[LANGUAGE],[VERSION],$(1))

.PHONY: build build_image

## build: build docker image
build: $(if $(strip $(image_id)),,build_image)

build_image:
	@echo "Building image for '${image_tag}'"
	@docker build ${setup_base}/build --build-arg VERSION=[VERSION] -t ${image_tag}

setup_link:
	@echo
	@echo "The default location for dojos' folder is not being used or the setup_link was removed."
	@echo "A symlink called 'setup_link' pointing to the dojos setup folder is necessary."
	@echo "Run the following to create it:"
	@echo "ln -s {relative_path/to/dojo-template/setup} setup_link"

