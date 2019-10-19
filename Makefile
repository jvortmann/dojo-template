##>> setup dojo (accepts 'url', 'problem' and 'language (defaults to python)' [with version] params)
context_file = $(word 1,$(abspath $(MAKEFILE_LIST)))
context_name = "dojo"

.DEFAULT_GOAL := all

.PHONY: all create setup/${language} build dates help description how_to

LANGUAGE_ERROR = $(error "Language was not defined. Use 'language=ruby' to define it.")
PROBLEM_ERROR = $(error "Problem name was not defined. Use 'url="http://some_url.com/to/a/{problem}/" or problem="Problem Name"' to define it.")

base_path ?= ${CURDIR}/dojos
language ?= python #default language to python

ifeq (${url},)
problem := $(shell echo ${problem} | tr '[:upper:]' '[:lower:]'| tr ' ' '_')
else
override problem = $(shell echo "${url}" | sed -E "s/\/([^/]+)\/?$$/ \1/" | awk '{print $$2}')
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
	@grep "# DOJO" -R ${base_path} | sed "s/.*dojos\/\(.*\)\/\(.*\)\/README.md:# DOJO \(.*\)$$/\3 \1 \2/" | xargs -L1 printf "\033[34m%-11s\033[0m%s \033[37m%-25s\033[33m%-8s\033[0m\n" | sort

## histogram: show histogram of dojos per month
histogram:
	@echo Dojos per month:
	@$(MAKE) dates | cut -d'-' -f1,2 | uniq -c | while read -r amount date; do echo "$$date $$amount `jot -b '#' - 1 $$amount | xargs | tr -d ' '`"; done | tr -dc '[[:print:]]\n' | cut -c5- | xargs printf "\033[34m %-8s \033[37m%-2d \033[32m%s\033[0m\n"

${folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating '${problem}' at '${folder}'"
	@mkdir -p ${folder}

## help: show this message
help: description tasks_with_examples tasks_without_examples
	@echo
	@$(MAKE) how_to

tasks_without_examples:
	@sed -nE 's/^## (.*): ([^>]*)$$/"\1" "\2"/p' $(context_file) | xargs printf "\033[34m %-20s\033[0m%s\n\033[0m"

tasks_with_examples:
	@sed -nE 's/^## (.*): (.*) (\[>.*\])$$/"\1" "\2" "\3"/p' $(context_file) | xargs printf "\033[34m %-20s\033[0m%s\n\033[35m\t\t\t%-48s\n\033[0m"

## description: show description of the project
description:
	@sed -nE 's/^##>> (.*)$$/"\1"/p' $(context_file) | xargs printf "\033[37m%-20s\033[0m \033[33m%-20s\033[0m%s\n" "[$(context_name)]"

## how_to: show how to
how_to:
	@echo "How to:"
	@echo
	@echo "Examples of full command to create a problem folder for a particular version of ruby language"
	@echo "> make url='http://dojopuzzles.com/problemas/exibe/{problem}/' language=ruby version=2.6.0"
	@echo "or"
	@echo "> make problem='Problem name' language=ruby version=2.6.0"
	@echo
