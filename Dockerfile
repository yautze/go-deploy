# Build Stage 

# 設定golang docker環境 golang:tag
#FROM golang:alpine AS build-env

## 設定帶入參數
##ARG VERSION
##ARG COMMIT
##ARG Build

#ADD . /src

## Build go exe
#RUN cd /src && go build -o app

## Final Stage 

## 設定deploy環境
#FROM alpine:latest

## 取得build好的golang環境
#COPY --from=build-env /src/app /app/

## 建立執行資料夾
#WORKDIR /app

## golang exe 
#ENTRYPOINT ["./app"]

## version cmd
#CMD ["version"]


# build stage
FROM golang:alpine AS build-env

COPY . /work
WORKDIR /work

RUN go build -o app

# final stage
FROM alpine:latest
COPY --from=build-env /work/app /app
WORKDIR /
ENTRYPOINT ["./app"]
CMD ["version"]
