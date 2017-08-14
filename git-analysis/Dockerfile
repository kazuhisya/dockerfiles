# vi: set ft=dockerfile :

FROM alpine:3.6
ENV TZ="JST-9"
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN apk add --update \
    ruby2.2 ruby2.2-dev ruby2.2-io-console \
    make gcc cmake musl-dev \
    git jq bash bash-completion && \
    rm -f /var/cache/apk/*
RUN gem2.2 install git_analysis --no-ri --no-rdoc

# 1. git clone XXXXXX && cd XXXXXX
# 2. git-analysis count -d | jq .

