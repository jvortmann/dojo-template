.PHONY: badge

badge: ${folder}/README.md
	@echo "Setting ${language} badge"
	@sed -i .bkp -e "s/\\[LANGUAGE\\]/${language}/g" -e "s/\\[VERSION\\]/${version}/g" "${folder}/README.md"
	@rm ${folder}/README.md.bkp

${folder}/.${language}-version: ${folder}
	@echo "Setting ${language} version file"
	@echo ${version} > ${folder}/.${language}-version

${folder}/Makefile: ${folder}
	@echo "Setting Makefile"
	@sed "s/\\[VERSION\\]/${version}/g" "${setup_base}/template/Makefile" > ${folder}/Makefile
