# vi: set ft=dockerfile :

FROM alpine:3.7
ENV TZ="JST-9"
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN apk add --update \
    ruby ruby-dev ruby-io-console \
    make gcc cmake musl-dev \
    git jq bash bash-completion && \
    rm -f /var/cache/apk/*
RUN gem install git_analysis --no-ri --no-rdoc

# 1. git clone XXXXXX && cd XXXXXX
# 2. git-analysis count -d | jq .

