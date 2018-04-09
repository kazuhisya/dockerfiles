# vi: set ft=dockerfile :

FROM centos:7
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN yum install -y --setopt=tsflags=nodocs \
        firefox icedtea-web \
        sudo bash bash-completion \
        glibc-langpack-ja glibc-locale-source \
        vlgothic-fonts vlgothic-p-fonts && \
        rm -rf /var/cache/yum

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    localedef -i ja_JP -f UTF-8 ja_JP.UTF-8 | true && \
    export uid=1000 gid=1000 && \
    mkdir -p /home/java && \
    echo "java:x:${uid}:${gid}:Developer,,,:/home/java:/bin/bash" >> /etc/passwd && \
    echo "java:x:${uid}:" >> /etc/group && \
    echo "java ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/java && \
    chmod 0440 /etc/sudoers.d/java && \
    cp /etc/skel/.bash* /home/java/ && \
    mkdir -p /home/java/.java/drive_c/windows/Fonts && \
    cp /usr/share/fonts/vlgothic/*.ttf /home/java/.java/drive_c/windows/Fonts/ && \
    chown ${uid}:${gid} /home/java -R

USER java
ENV HOME="/home/java" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/java

CMD /bin/bash
