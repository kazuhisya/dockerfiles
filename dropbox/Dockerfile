# vi: set ft=dockerfile :

FROM centos:7
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

# env
ENV TZ="JST-9"

# yum
RUN yum install -y --setopt=tsflags=nodocs wget && \
    yum clean all

WORKDIR /root

# install
RUN mkdir ~/bin && \
    wget https://www.dropbox.com/download?dl=packages/dropbox.py -O ~/bin/dropbox-cli && \
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

RUN mkdir -p ~/.dropbox ~/Dropbox && \
    chmod +x ~/bin/dropbox-cli

VOLUME ["/root/Dropbox", "/root/.dropbox"]

CMD ["/root/.dropbox-dist/dropboxd"]
