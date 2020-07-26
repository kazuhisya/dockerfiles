# vi: set ft=dockerfile :

FROM registry.access.redhat.com/rhel6/rhel
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ADD vault-i386.repo /etc/yum.repos.d/vault-i386.repo
RUN yumdownloader --disablerepo=* --enablerepo=C6-base-i386,C6-updates-i386 \
        java-1.8.0-openjdk-headless.i686 \
        java-1.8.0-openjdk.i686 \
        mozilla-filesystem.i686 \
        icedtea-web.i686 && \
    yum install -y --enablerepo=rhel-6-server-optional-rpms,rhel-6-server-supplementary-rpms \
        firefox-52.8.0-1.el6_9.i686 \
        flash-plugin.i686 \
        sudo bash glibc \
        vlgothic-fonts vlgothic-p-fonts \
        ipa-gothic-fonts.noarch \
        redhat-indexhtml \
        ./*.rpm \
        --exclude icedtea-web.x86_64 \
        --exclude java-1.8.0-openjdk-headless.x86_64 \
        --exclude java-1.8.0-openjdk.x86_64 \
        && \
    rm -rf /var/cache/yum \
        *.rpm

ADD java.security /usr/lib/jvm/jre-1.8.0-openjdk.i386/lib/security/java.security

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    useradd java -u 1000 && \
    echo "java ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    cp /etc/skel/.bash* /home/java/ && \
    chown java:java /home/java -R && \
    mkdir -p /usr/lib/jvm/jre-1.8.0-openjdk.i386/lib/fonts/fallback && \
    cp /usr/share/fonts/ipa-gothic/*.ttf /usr/lib/jvm/jre-1.8.0-openjdk.i386/lib/fonts/fallback/ && \
    dbus-uuidgen > /var/lib/dbus/machine-id

USER java
ENV HOME="/home/java" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/java

CMD /bin/bash
