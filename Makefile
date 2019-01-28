.PHONY: all setup/${language} build build/${language} help

LANGUAGE_ERROR = $(error "Language was not defined. Use 'language=ruby' to define it.")
PROBLEM_ERROR = $(error "Problem name was not defined. Use 'problem="Problem Name"' to define it.")

base_path ?= ${CURDIR}/dojos
canonical_problem = $(shell echo ${problem} | tr '[:upper:]' '[:lower:]'| tr ' ' '_')
export folder = ${base_path}/${canonical_problem}

all: build ${folder} setup/${language}

setup: setup/${language}

setup/${language}: ${folder}
	$(if ${language},,${LANGUAGE_ERROR})
	$(if ${problem},,${PROBLEM_ERROR})
	@$(MAKE) setup -C setup/${language}

build: setup/${language}/build
	$(if ${language},,${LANGUAGE_ERROR})
	@$(MAKE) build -C setup/${language}

${folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating '${problem}' at '${folder}'"
	@mkdir -p ${folder}

help:
	@echo "Help:"
	@echo
	@echo "Build and Setup:"
	@echo "> make problem='Name of the Problem' language=ruby [version=2.6.0]"
	@echo
	@echo "Build:"
	@echo "> make build language=ruby [version=2.6.0]"
	@echo
	@echo "Setup:"
	@echo "> make problem='Name of the Problem' language=ruby [version=2.6.0]"
