.PHONY: all setup build help

setup_base := ${CURDIR}
language := ruby
version ?= $(shell cat ${setup_base}/template/.ruby-version)
base_path ?= ${setup_base}/../dojos
canonical_problem = $(shell echo ${problem} | tr '[:upper:]' '[:lower:]'| tr ' ' '_')
folder = ${base_path}/${canonical_problem}/${language}

all: build setup

setup: ${folder} ${folder}/lib/ ${folder}/spec/ ${folder}/Makefile ${folder}/.irbrc ${folder}/README.md

build:
	@echo "Building image for '${language}' (use can specify the version using: version=2.6.0)"
	@docker build ${setup_base}/build/ -t dojo/${language}:${version}

${folder}:
	$(if ${problem},,$(error "Problem name was not defined. Use problem='Problem Name' to define it."))
	@echo "Creating '${problem}' for '${language}' at '${folder}'"
	@mkdir -p ${folder}

${folder}/lib: ${folder}
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/lib ${folder}/

${folder}/spec: ${folder}
	@echo "Setting Test folder"
	@cp -r ${setup_base}/template/spec ${folder}/

${folder}/.irbrc: ${folder}
	@echo "Setting Console config"
	@cp ${setup_base}/template/.irbrc ${folder}/.irbrc

${folder}/Makefile: ${folder}
	@echo "Setting Makefile"
	@sed "s/\\[RUBY_VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${folder}/Makefile

${folder}/README.md: ${folder}
	@echo "Setting Readme"
	@sed "s/\\[DATA\\]/$(shell date "+%Y-%m-%d %H:%M:%S")/g" "${setup_base}/template/README.md" | \
	sed "s/\\[PROBLEM\\]/${problem}/g" | \
	sed "s/\\[RUBY_VERSION\\]/${version}/g" > \
	"${folder}/README.md"

help:
	@echo "Help:"
	@echo
	@echo "Build and Setup:"
	@echo "> make problem='Name of the Problem' [version=2.6.0]"
	@echo
	@echo "Build:"
	@echo "> make build [version=2.6.0]"
	@echo
	@echo "Setup:"
	@echo "> make setup problem='Name of the Problem'"
