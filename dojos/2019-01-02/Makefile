docker-start:
	docker run -it --rm --name dojo-poa-2019-01-02 -v `pwd`:/usr/src/dojo -w /usr/src/dojo python:3.7.2 bash

setup:
	pip install -r requirements.txt

tests:
	pytest tests

.PHONY: docker-start setup tests
