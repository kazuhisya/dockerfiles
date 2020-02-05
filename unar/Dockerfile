# vi: set ft=dockerfile :

FROM centos:7
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

# env
ENV TZ="JST-9" \
    LANG="en_US.UTF-8"

# yum
RUN yum install -y --setopt=tsflags=nodocs \
      bash-completion epel-release && \
    yum install -y --setopt=tsflags=nodocs \
      unar && \
    yum clean all

WORKDIR /root/share


VOLUME ["/root/share"]

CMD [bash]
