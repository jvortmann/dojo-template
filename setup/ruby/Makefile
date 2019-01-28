.PHONY: all setup build help

setup_base := ${CURDIR}
language := ruby
version ?= $(shell cat ${setup_base}/template/.ruby-version)
problem_folder = ${folder}/${language}

PROBLEM_ERROR = $(error "Problem name was not defined. Use 'problem="Problem Name"' to define it.")

all: build setup

setup: ${problem_folder} ${problem_folder}/lib/ ${problem_folder}/spec/ ${problem_folder}/Makefile ${problem_folder}/.irbrc ${problem_folder}/README.md

build:
	@echo "Building image for '${language}' (use can specify the version using: version=2.6.0)"
	@docker build ${setup_base}/build/ -t dojo/${language}:${version}

${problem_folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating setup for '${language}' at '${problem_folder}'"
	@mkdir -p ${problem_folder}

${problem_folder}/lib: ${problem_folder}
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/lib ${problem_folder}/

${problem_folder}/spec: ${problem_folder}
	@echo "Setting Test folder"
	@cp -r ${setup_base}/template/spec ${problem_folder}/

${problem_folder}/.irbrc: ${problem_folder}
	@echo "Setting Console config"
	@cp ${setup_base}/template/.irbrc ${problem_folder}/.irbrc

${problem_folder}/Makefile: ${problem_folder}
	@echo "Setting Makefile"
	@sed "s/\\[RUBY_VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${problem_folder}/Makefile

${problem_folder}/README.md: ${problem_folder}
	@echo "Setting Readme"
	@sed "s#\\[DATA\\]#$(shell date "+%Y-%m-%d %H:%M:%S")#g" "${setup_base}/template/README.md" | \
	sed "s#\\[PROBLEM\\]#${problem}#g" | \
	sed "s#\\[RUBY_VERSION\\]#${version}#g" | \
	sed "s#\\[URL\\]#${url}#g" > \
	"${problem_folder}/README.md"

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
