FROM golang:1.11.5-alpine

ENV GOPATH $GOPATH:/dojo/problem

RUN apk update
RUN apk add --no-cache git
RUN go get -u github.com/stretchr/testify

RUN mkdir -p /dojo/problem

WORKDIR /dojo/problem
