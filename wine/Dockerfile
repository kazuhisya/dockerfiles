# vi: set ft=dockerfile :

FROM fedora:30
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN dnf install -y --setopt=tsflags=nodocs \
        wine winetricks zenity \
        sudo bash bash-completion procps-ng \
        glibc-langpack-ja findutils \
        aria2 binutils cabextract p7zip-plugins \
        polkit unzip wget xdg-utils xz \
        vlgothic-fonts vlgothic-p-fonts && \
    rm -rf /var/cache/yum && rm -rf /var/cache/dnf

RUN dnf install -y --setopt=tsflags=nodocs \
        https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    dnf install -y --setopt=tsflags=nodocs unrar

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
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
