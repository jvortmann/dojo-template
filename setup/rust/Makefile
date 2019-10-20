.PHONY: all setup build help

setup_base := ${CURDIR}
language := rust
version = 1.38.0# default version if unspecified
problem_folder = ${folder}/${language}

PROBLEM_ERROR = $(error "Problem name was not defined. Use 'problem="Problem Name"' to define it.")

all: build setup

setup: ${problem_folder} ${problem_folder}/src/ ${problem_folder}/Makefile ${problem_folder}/.rust-version ${problem_folder}/Cargo.toml ${problem_folder}/README.md 

build:
	@echo "Building image for '${language}:${version}'"
	@docker build ${setup_base}/build/ --build-arg VERSION=${version} -t dojo/${language}:${version}

${problem_folder}:
	$(if ${problem},,${PROBLEM_ERROR})
	@echo "Creating setup for '${language}' at '${problem_folder}'"
	@mkdir -p ${problem_folder}

${problem_folder}/src:
	@echo "Setting Source folder"
	@cp -r ${setup_base}/template/src ${problem_folder}/

${problem_folder}/Makefile: ${problem_folder}
	@echo "Setting Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${problem_folder}/Makefile

${problem_folder}/.rust-version: ${problem_folder}
	@echo "Setting rust version file"
	@echo ${version} > ${problem_folder}/.rust-version

${problem_folder}/Cargo.toml: ${problem_folder}
	@echo "Setting Manifest file"
	@cp ${setup_base}/template/Cargo.toml ${problem_folder}/

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
	@echo "> make problem='Name of the Problem'"
	@echo
	@echo "Build:"
	@echo "> make build"
	@echo
	@echo "Setup:"
	@echo "> make setup problem='Name of the Problem'"
