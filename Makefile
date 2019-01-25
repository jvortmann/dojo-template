.PHONY: all setup/${language} build build/${language} help

LANGUAGE_ERROR = $(error "Language was not defined. Use 'language=ruby' to define it.")
PROBLEM_ERROR = $(error "Problem name was not defined. Use 'problem="Problem Name"' to define it.")

all: build setup/${language}

setup: setup/${language}

setup/${language}:
	$(if ${language},,${LANGUAGE_ERROR})
	$(if ${problem},,${PROBLEM_ERROR})
	@$(MAKE) setup -C setup/${language}

build: setup/${language}/build
	$(if ${language},,${LANGUAGE_ERROR})
	@$(MAKE) build -C setup/${language}

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
