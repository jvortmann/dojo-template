.PHONY: all setup build help

setup_base := ${CURDIR}
language := go
problem_folder = ${folder}/${language}

PROBLEM_ERROR = $(error "Problem name was not defined. Use 'problem="Problem Name"' to define it.")

all: build setup

setup: ${problem_folder} ${problem_folder}/main.go ${problem_folder}/main_test.go ${problem_folder}/Makefile ${problem_folder}/README.md

build:
	@echo "Building image for '${language}'"
	@docker build ${setup_base}/build/ -t dojo/${language}

${problem_folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating setup for '${language}' at '${problem_folder}'"
	@mkdir -p ${problem_folder}

${problem_folder}/main.go: ${problem_folder}
	@echo "Setting source file"
	@cp ${setup_base}/template/main.go ${problem_folder}/

${problem_folder}/main_test.go: ${problem_folder}
	@echo "Setting source file"
	@cp ${setup_base}/template/main_test.go ${problem_folder}/

${problem_folder}/Makefile: ${problem_folder}
	@echo "Creating Makefile"
	@cp ${setup_base}/template/Makefile ${problem_folder}/Makefile

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
	@echo "> make problem='Name of the Problem'"
	@echo
	@echo "Build:"
	@echo "> make build"
	@echo
	@echo "Setup:"
	@echo "> make setup problem='Name of the Problem'"
