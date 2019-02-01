.PHONY: all create setup/${language} build dates help

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

all: create build setup/${language}

create: ${folder}

setup: setup/${language}

setup/${language}: ${folder}
	$(if ${language},,${LANGUAGE_ERROR})
	$(if ${problem},,${PROBLEM_ERROR})
	@$(MAKE) setup -C setup/${language}

build: setup/${language}/build
	$(if ${language},,${LANGUAGE_ERROR})
	@$(MAKE) build -C setup/${language}

dates:
	@grep "# DOJO" -R ${base_path} | sed "s/.*dojos\/\(.*\)\/README.md:# DOJO \(.*\)$$/dojos\/\1$$(printf '\t')\2/"

${folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating '${problem}' at '${folder}'"
	@mkdir -p ${folder}

help:
	@echo "Help:"
	@echo
	@echo "Create problem folder:"
	@echo "> make create url='http://dojopuzzles.com/problemas/exibe/{problem}/'"
	@echo "or"
	@echo "> make create problem='Name of the Problem'"
	@echo
	@echo "Create, Build and Setup:"
	@echo "> make url='http://dojopuzzles.com/problemas/exibe/{problem}/' language=ruby [version=2.6.0]"
	@echo "or"
	@echo "> make problem='Name of the Problem' language=ruby [version=2.6.0]"
	@echo
	@echo "Build:"
	@echo "> make build language=ruby [version=2.6.0]"
	@echo
	@echo "Create and Setup:"
	@echo "> make setup url='http://dojopuzzles.com/problemas/exibe/{problem}/' language=ruby [version=2.6.0]"
	@echo "or"
	@echo "> make setup problem='Name of the Problem' language=ruby [version=2.6.0]"
	@echo
	@echo "List dojo dates:"
	@echo "> make dates"
