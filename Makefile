##>> setup dojo (accepts 'url', 'problem' and 'language (defaults to python)' [with version] params)
context_file = $(word 1,$(abspath $(MAKEFILE_LIST)))
context_name = "dojo"

language ?= python# default language to python
base_path ?= ${CURDIR}/dojos
setup_base := ${CURDIR}/setup


.DEFAULT_GOAL := all

.PHONY: all create setup build dojos dojos_dates dates date_range start_date help description how_to

PROBLEM_ERROR = $(error "Problem name was not defined. Use 'url="http://some_url.com/to/a/{problem}/" or problem="Problem Name"' to define it.")

ifeq (${url},)
problem := $(shell echo ${problem} | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
else
override problem = $(shell echo "${url}" | sed -E "s/\/([^/]+)\/?$$/ \1/" | awk '{print $$2}')
export problem
endif

canonical_problem = $(shell echo ${problem} | tr '[:upper:]' '[:lower:]'| tr ' ' '_')

export folder = ${base_path}/${canonical_problem}/${language}

## {no task}: [default] build, create and setup problem folder [> make url='http://dojopuzzles.com/problemas/exibe/{problem}/ language=python' or > make problem='Problem name' language=python]
all: create build setup

## create: only create problem folder [> make create url='http://dojopuzzles.com/problemas/exibe/{problem}/ language=python' or > make create problem='Problem name language=python']
create: ${folder} ${folder}/README.md

## setup: create and setup problem folder for a particular language [> make setup url='http://dojopuzzles.com/problemas/exibe/{problem}/ language=python' or > make setup problem='Problem Name' language=python]
setup: create
	@$(MAKE) setup -C setup/${language}

## build: build an language image [> make build language=ruby version=2.6.0]
build:
	@$(MAKE) build -C setup/${language}

${folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating '${problem}' for ${language} at '${folder}'"
	@mkdir -p ${folder}

${folder}/README.md: ${folder}
	@echo "Setting Readme"
	@sed "s#\\[DATA\\]#$(shell date "+%Y-%m-%d %H:%M:%S")#g" "${setup_base}/README.md" | \
	sed "s#\\[PROBLEM\\]#${problem}#g" | \
	sed "s#\\[URL\\]#${url}#g" > \
	"${folder}/README.md"

## dates: list previous dojos with dates
dates:
	@$(MAKE) dojos | xargs -L1 printf "\033[34m%-11s\033[0m%s \033[37m%-25s\033[33m%-8s\033[0m\n" | sort

## histogram: show histogram of dojos per month
histogram: SHELL := /bin/bash
histogram:
	@echo Dojos per month:
	@cat <($(MAKE) dojos_dates | cut -f1,2 -d'-') <($(MAKE) date_range) | sort | uniq -c | while read -r amount date; do echo "$$date $$(($$amount - 1)) |`jot -b '#' - 0 $$(($$amount - 1)) | xargs | tr -d ' ' | cut -c2-`"; done | xargs printf "\033[34m%-8s\033[37m%-2d\033[32m%s\033[0m\n"

dojos:
	@grep "# DOJO" -R ${base_path} | sed "s/.*dojos\/\(.*\)\/\(.*\)\/README.md:# DOJO \(.*\)$$/\3 \1 \2/"

dojos_dates:
	@$(MAKE) dojos | cut -f1 -d' ' | sort

date_range:
	@dateseq `$(MAKE) start_date` 1mo `date +%Y-%m` -f %Y-%m

start_date:
	@$(MAKE) dates | cut -f1,2 -d'-' | head -n1 | sed -E "s/[[:cntrl:]]\[[0-9]*m//g"

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
