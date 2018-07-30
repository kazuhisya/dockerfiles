# vi: set ft=dockerfile :

FROM alpine:3.8
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV GITBUCKET_VERSION="4.27.0" \
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

# Configure heap memory by cgroup memory limit
# https://blogs.oracle.com/java-platform-group/java-se-support-for-docker-cpu-and-memory-limits
ENV JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap

CMD java ${JAVA_OPTS} -jar ./gitbucket.war --port=${PORT} --gitbucket.home=${DATA_DIR}
