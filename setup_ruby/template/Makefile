.PHONY: test watch console login

test:
	@docker run -it -v ${PWD}:/dojo/problem dojo/ruby bundle exec rspec

watch:
	@docker run -it -v ${PWD}:/dojo/problem dojo/ruby bundle exec guard --guardfile ../Guardfile

console:
	@docker run -it -v ${PWD}:/dojo/problem dojo/ruby irb

login:
	@docker run -it -v ${PWD}:/dojo/problem dojo/ruby bash
