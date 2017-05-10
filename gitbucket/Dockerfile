# vi: set ft=dockerfile :

FROM centos:7
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV GITBUCKET_VERSION="4.10" \
    PORT="8080"
EXPOSE 8080

RUN yum install -y java-1.8.0-openjdk-headless && yum clean all
WORKDIR /opt

RUN curl -OL https://github.com/gitbucket/gitbucket/releases/download/${GITBUCKET_VERSION}/gitbucket.war
CMD java -jar ./gitbucket.war --port=${PORT}
