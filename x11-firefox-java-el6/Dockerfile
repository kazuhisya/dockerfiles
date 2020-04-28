# vi: set ft=dockerfile :

FROM centos:6
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ADD vault-i386.repo /etc/yum.repos.d/vault-i386.repo
RUN yum install -y --setopt=tsflags=nodocs \
        firefox-52.8.0-1.el6.centos.i686 \
        java-1.8.0-openjdk-headless.i686 \
        java-1.8.0-openjdk.i686 \
        icedtea-web.i686 \
        epel-release \
        sudo bash \
        glibc \
        vlgothic-fonts vlgothic-p-fonts \
        --exclude java-1.8.0-openjdk-headless.x86_64 \
        --exclude java-1.8.0-openjdk.x86_64 \
        && \
    yum install -y --setopt=tsflags=nodocs \
        ipa-gothic-fonts.noarch \
        bash-completion && \
    rm -rf /var/cache/yum

ADD java.security /usr/lib/jvm/jre-1.8.0-openjdk.i386/lib/security/java.security

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    useradd java -u 1000 && \
    echo "java ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    cp /etc/skel/.bash* /home/java/ && \
    chown java:java /home/java -R && \
    mkdir -p /usr/lib/jvm/jre-1.8.0-openjdk.i386/lib/fonts/fallback && \
    cp /usr/share/fonts/ipa-gothic/*.ttf /usr/lib/jvm/jre-1.8.0-openjdk.i386/lib/fonts/fallback/

USER java
ENV HOME="/home/java" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/java

CMD /bin/bash
