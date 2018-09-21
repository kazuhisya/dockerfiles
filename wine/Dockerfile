# vi: set ft=dockerfile :

FROM fedora:28
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN dnf install -y --setopt=tsflags=nodocs \
        wine winetricks zenity \
        sudo bash bash-completion \
        glibc-langpack-ja glibc-locale-source \
        vlgothic-fonts vlgothic-p-fonts && \
        rm -rf /var/cache/yum && rm -rf /var/cache/dnf

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    localedef -i ja_JP -f UTF-8 ja_JP.UTF-8 | true && \
    export uid=1000 gid=1000 && \
    mkdir -p /home/wine && \
    echo "wine:x:${uid}:${gid}:Developer,,,:/home/wine:/bin/bash" >> /etc/passwd && \
    echo "wine:x:${uid}:" >> /etc/group && \
    echo "wine ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wine && \
    chmod 0440 /etc/sudoers.d/wine && \
    cp /etc/skel/.bash* /home/wine/ && \
    mkdir -p /home/wine/.wine/drive_c/windows/Fonts && \
    cp /usr/share/fonts/vlgothic/*.ttf /home/wine/.wine/drive_c/windows/Fonts/ && \
    chown ${uid}:${gid} /home/wine -R

USER wine
ENV HOME="/home/wine" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/wine

CMD /bin/bash
