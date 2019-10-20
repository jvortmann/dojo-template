ARG VERSION
FROM golang:${VERSION}

RUN mkdir -p /dojo/problem

RUN go get -u github.com/stretchr/testify
RUN go get -u github.com/kyoh86/richgo

ENV GOPATH $GOPATH:/dojo/problem

WORKDIR /dojo/problem
