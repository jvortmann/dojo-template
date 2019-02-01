FROM golang:1.11.5

RUN mkdir -p /dojo/problem

RUN go get -u github.com/stretchr/testify
RUN go get -u github.com/kyoh86/richgo

ENV GOPATH $GOPATH:/dojo/problem

WORKDIR /dojo/problem
