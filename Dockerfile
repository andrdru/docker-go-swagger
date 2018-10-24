FROM golang:alpine

ARG BUILD_SW_WORKDIR="/src"

ARG BUILD_SW_FILE="swagger.json"
ARG BUILD_SW_PORT="80"
ARG BUILD_SW_HOST="0.0.0.0"
ARG BUILD_SW_BASEPATH="/"
ARG BUILD_SW_FLAVOR="redoc"

ENV SW_WORKDIR="$BUILD_SW_WORKDIR"

ENV SW_FILE="$BUILD_SW_FILE"
ENV SW_PORT="$BUILD_SW_PORT"
ENV SW_HOST="$BUILD_SW_HOST"
ENV SW_BASEPATH="$BUILD_SW_BASEPATH"
ENV SW_FLAVOR="$BUILD_SW_FLAVOR"

RUN mkdir -p ${SW_WORKDIR} &&\
apk --no-cache add git &&\
go get -u github.com/go-swagger/go-swagger/cmd/swagger

WORKDIR ${SW_WORKDIR}

#ENTRYPOINT swagger generate spec -o ${SW_FILE} && swagger serve --no-open --port=${SW_PORT} --host="${SW_HOST}" --base-path="${SW_BASEPATH}" --flavor="${SW_FLAVOR}" "${SW_FILE}"
ENTRYPOINT swagger serve --no-open --port=${SW_PORT} --host="${SW_HOST}" --base-path="${SW_BASEPATH}" --flavor="${SW_FLAVOR}" "${SW_FILE}"

EXPOSE ${SW_PORT}
