##>> setup dojo (accepts 'url', 'problem' and 'language'[with version] params)
context_file = $(word 1,$(abspath $(MAKEFILE_LIST)))
context_name = "dojo"

.DEFAULT_GOAL := all

.PHONY: all create setup/${language} build dates help description how_to

LANGUAGE_ERROR = $(error "Language was not defined. Use 'language=ruby' to define it.")
PROBLEM_ERROR = $(error "Problem name was not defined. Use 'url="http://dojopuzzles.com/problemas/exibe/{problem}/" or problem="Problem Name"' to define it.")

base_path ?= ${CURDIR}/dojos

ifeq (${url},)
problem := $(shell echo ${problem} | tr '[:upper:]' '[:lower:]'| tr ' ' '_')
else
override problem = $(subst /,,$(subst http://dojopuzzles.com/problemas/exibe/,,${url}))
export problem
endif

canonical_problem = $(shell echo ${problem} | tr '[:upper:]' '[:lower:]'| tr ' ' '_')

export folder = ${base_path}/${canonical_problem}

## {no task}: [default] build, create and setup problem folder [> make url='http://dojopuzzles.com/problemas/exibe/{problem}/' or > make problem='Problem name']
all: create build setup/${language}

## create: only create problem folder [> make create url='http://dojopuzzles.com/problemas/exibe/{problem}/' or > make create problem='Problem name']
create: ${folder}

## setup: create and setup problem folder for a particular language [> make setup url='http://dojopuzzles.com/problemas/exibe/{problem}/' or > make setup problem='Problem Name']
setup: setup/${language}

setup/${language}: ${folder}
	$(if ${language},,${LANGUAGE_ERROR})
	$(if ${problem},,${PROBLEM_ERROR})
	@$(MAKE) setup -C setup/${language}

## build: build an language image [> make build language=ruby [version=2.6.0]]
build: setup/${language}/build
	$(if ${language},,${LANGUAGE_ERROR})
	@$(MAKE) build -C setup/${language}

## dates: list previous dojos with dates
dates:
	@grep "# DOJO" -R ${base_path} | sed "s/.*dojos\/\(.*\)\/README.md:# DOJO \(.*\)$$/\1 \2/" | xargs -L1 printf "\033[37m%-40s\033[0m  [\033[34m%-11s\033[0m%s]\n"

${folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating '${problem}' at '${folder}'"
	@mkdir -p ${folder}

## help: show this message
help: description tasks_with_examples description tasks_without_examples
	@echo
	@$(MAKE) how_to

tasks_without_examples:
	@sed -nE 's/^## (.*): ([^>]*)$$/"\1" "\2"/p' $(context_file) | xargs printf "\033[34m %-20s\033[0m%s\n\033[0m"

tasks_with_examples:
	@sed -nE 's/^## (.*): (.*) (\[>.*\])$$/"\1" "\2" "\3"/p' $(context_file) | xargs printf "\033[34m %-20s\033[0m%s\n\033[33m\t\t\t%-48s\n\033[0m"

## description: show description of the project
description:
	@sed -nE 's/^##>> (.*)$$/"\1"/p' $(context_file) | xargs printf "\033[37m%-20s\033[0m \033[34m%-20s\033[0m%s\n" "[$(context_name)]"

## how_to: show how to
how_to:
	@echo "How to:"
	@echo
	@echo "Examples of full command to create a problem folder for a particular language (ruby)"
	@echo "> make url='http://dojopuzzles.com/problemas/exibe/{problem}/' language=ruby [version=2.6.0]"
	@echo "or"
	@echo "> make problem='Problem name' language=ruby [version=2.6.0]"
	@echo
