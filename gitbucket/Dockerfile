# vi: set ft=dockerfile :

FROM alpine:3.6
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV GITBUCKET_VERSION="4.17.0" \
    PORT="8080" \
    DATA_DIR="/opt/.gitbucket" \
    TZ="JST-9"

RUN apk update && apk add \
        curl openjdk8-jre-base && \
        rm -rf /var/cache/apk/* && \
    mkdir -p /opt

VOLUME ${DATA_DIR}
EXPOSE ${PORT}

WORKDIR /opt
RUN curl -OL https://github.com/gitbucket/gitbucket/releases/download/${GITBUCKET_VERSION}/gitbucket.war
CMD java -jar ./gitbucket.war --port=${PORT} --gitbucket.home=${DATA_DIR}
