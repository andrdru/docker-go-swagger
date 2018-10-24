FROM golang:alpine

RUN apk --no-cache add git &&\
go get -u github.com/go-swagger/go-swagger/cmd/swagger

EXPOSE 1234