.PHONY: all setup build help

setup_base := ${CURDIR}
language := python
version ?= $(shell cat ${setup_base}/template/.python-version)
problem_folder = ${folder}/${language}

PROBLEM_ERROR = $(error "Problem name was not defined. Use 'problem="Problem Name"' to define it.")

all: build setup

setup: ${problem_folder} ${problem_folder}/dojo.py ${problem_folder}/tests.py ${problem_folder}/Makefile ${problem_folder}/README.md

build:
	@echo "Building image for '${language}' (use can specify the version using: version=3.7.2)"
	@docker build --no-cache ${setup_base}/build/ -t dojo/${language}:${version}

${problem_folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating setup for '${language}' at '${problem_folder}'"
	@mkdir -p ${problem_folder}

${problem_folder}/Makefile: ${problem_folder}
	@echo "Setting Makefile"
	@sed "s/\\[PYTHON_VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${problem_folder}/Makefile

${problem_folder}/dojo.py: ${problem_folder}
	@echo "Create source file"
	@cp -r ${setup_base}/template/dojo.py ${problem_folder}/

${problem_folder}/tests.py: ${problem_folder}
	@echo "Create tests file"
	@cp -r ${setup_base}/template/tests.py ${problem_folder}/

${problem_folder}/README.md: ${problem_folder}
	@echo "Setting Readme"
	@sed "s#\\[DATA\\]#$(shell date "+%Y-%m-%d %H:%M:%S")#g" "${setup_base}/template/README.md" | \
	sed "s#\\[PROBLEM\\]#${problem}#g" | \
	sed "s#\\[PYTHON_VERSION\\]#${version}#g" | \
	sed "s#\\[URL\\]#${url}#g" > \
	"${problem_folder}/README.md"

help:
	@echo "Help:"
	@echo
	@echo "Build and Setup:"
	@echo "> make problem='Name of the Problem' [version=3.7.2]"
	@echo
	@echo "Build:"
	@echo "> make build [version=3.7.2]"
	@echo
	@echo "Setup:"
	@echo "> make setup problem='Name of the Problem'"
