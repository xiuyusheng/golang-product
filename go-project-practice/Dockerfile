# FROM centos:7
FROM golang:1.20
# MAINTAINER 30446394522@qq.com

ENV LOGIN_PATH /gdgc-jw

COPY BackEnd ${LOGIN_PATH}

WORKDIR ${LOGIN_PATH}

RUN go env -w GOPROXY=https://goproxy.cn,direct && go mod tidy

EXPOSE 52273