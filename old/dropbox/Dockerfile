# vi: set ft=dockerfile :

FROM centos:8
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

# env
ENV TZ="JST-9"

# yum
RUN dnf install -y --setopt=tsflags=nodocs \
    python3 wget libstdc++ make gcc git procps-ng && \
    dnf clean all

WORKDIR /root

# install
RUN mkdir ~/bin && \
    wget https://www.dropbox.com/download?dl=packages/dropbox.py -O ~/bin/dropbox-cli && \
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

RUN mkdir -p ~/.dropbox ~/Dropbox && \
    chmod +x ~/bin/dropbox-cli

# Fake ext4
RUN git clone --depth=1 https://github.com/dark/dropbox-filesystem-fix && \
    cd dropbox-filesystem-fix && make -j

VOLUME ["/root/Dropbox", "/root/.dropbox"]

ADD CMD.sh /root/CMD.sh

#CMD ["/root/.dropbox-dist/dropboxd"]
CMD ["/root/CMD.sh"]
