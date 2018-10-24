FROM golang:alpine

ENV SW_FILE="swagger.json"
ENV SW_PORT="80"
ENV SW_HOST="0.0.0.0"
ENV SW_BASEPATH="/"
ENV SW_FLAVOR="redoc"

RUN mkdir /src &&\
apk --no-cache add git &&\
go get -u github.com/go-swagger/go-swagger/cmd/swagger

WORKDIR /src

ENTRYPOINT swagger serve --no-open --port=$SW_PORT --host="$SW_HOST" --base-path="$SW_BASEPATH" --flavor="$SW_FLAVOR" "$SW_FILE"

EXPOSE $SW_PORT
