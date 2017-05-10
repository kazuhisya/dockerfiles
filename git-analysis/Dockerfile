# vi: set ft=dockerfile :

FROM centos:7
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN yum install -y --setopt=tsflags=nodocs epel-release && \
    yum install -y --setopt=tsflags=nodocs ruby ruby-devel git make gcc cmake git jq bash-completion && \
    yum clean all
RUN gem install git_analysis

# 1. git clone XXXXXX && cd XXXXXX
# 2. git-analysis count -d | jq .

