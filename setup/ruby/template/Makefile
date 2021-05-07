-include [SETUP_BASE]/../run_tasks.mk
-include [SETUP_BASE]/../prerequisites.mk

setup_base := [SETUP_BASE]
image_tag := dojo/ruby:[VERSION]
image_id := $(shell docker images -q $(image_tag))
run = $(call docker,ruby,[VERSION],$(1))

.PHONY: build build_image test watch console

##>> tasks

## build: build docker image
build: $(if $(strip $(image_id)),,build_image)

build_image:
	@echo "Building image for '${image_tag}'"
	@docker build ${setup_base}/build --build-arg VERSION=[VERSION] -t ${image_tag}

## test: run specs
test: build
	@$(call run,bundle exec rspec)

## watch: run specs when files change
watch: build
	@$(call run,bundle exec guard --guardfile ../Guardfile --force-polling)

## console: open irb
console: build
	@$(call run,irb)
