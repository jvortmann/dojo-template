.PHONY: all setup build help

setup_base := ${CURDIR}
language := python
version ?= 3.7.4 # default version if unspecified
problem_folder = ${folder}/${language}

PROBLEM_ERROR = $(error "Problem name was not defined. Use 'problem="Problem Name"' to define it.")

all: build setup

setup: ${problem_folder} ${problem_folder}/dojo.py ${problem_folder}/tests.py ${problem_folder}/Makefile ${problem_folder}/.python-version ${problem_folder}/README.md

build:
	@echo "Building image for '${language}:${version}' (you can specify the version using: version=${version})"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t dojo/${language}:${version}

${problem_folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating setup for '${language}' at '${problem_folder}'"
	@mkdir -p ${problem_folder}

${problem_folder}/Makefile: ${problem_folder}
	@echo "Setting Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${problem_folder}/Makefile

${problem_folder}/dojo.py: ${problem_folder}
	@echo "Create source file"
	@cp ${setup_base}/template/dojo.py ${problem_folder}/

${problem_folder}/tests.py: ${problem_folder}
	@echo "Create tests file"
	@cp ${setup_base}/template/tests.py ${problem_folder}/

${problem_folder}/.python-version: ${problem_folder}
	@echo "Setting python version file"
	@echo ${version} > ${problem_folder}/.python-version

${problem_folder}/README.md: ${problem_folder}
	@echo "Setting Readme"
	@sed "s#\\[DATA\\]#$(shell date "+%Y-%m-%d %H:%M:%S")#g" "${setup_base}/template/README.md" | \
	sed "s#\\[PROBLEM\\]#${problem}#g" | \
	sed "s#\\[VERSION\\]#${version}#g" | \
	sed "s#\\[URL\\]#${url}#g" > \
	"${problem_folder}/README.md"

help:
	@echo "Help:"
	@echo
	@echo "Build and Setup:"
	@echo "> make problem='Name of the Problem' version=${version}"
	@echo
	@echo "Build:"
	@echo "> make build version=${version}"
	@echo
	@echo "Setup:"
	@echo "> make setup problem='Name of the Problem'"
