.PHONY: docker-start setup tests

docker-start:
	docker run -it --rm --name dojo-poa-2019-01-16 -v `pwd`:/go/src/dojo -w /go/src/dojo golang:1.11.4 bash

setup:
	curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
	dep ensure

test:
	go test -v ./...

