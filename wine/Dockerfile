# vi: set ft=dockerfile :

FROM fedora:32
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN dnf install -y --setopt=tsflags=nodocs \
        --disablerepo=* --enablerepo=fedora,updates \
        wine winetricks zenity \
        sudo bash bash-completion procps-ng \
        glibc-langpack-ja findutils \
        aria2 binutils cabextract p7zip-plugins \
        polkit unzip unar wget xdg-utils xz \
        vlgothic-fonts vlgothic-p-fonts && \
    rm -rf /var/cache/yum && rm -rf /var/cache/dnf

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    useradd wine && \
    echo "wine ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wine && \
    chmod 0440 /etc/sudoers.d/wine && \
    cp /etc/skel/.bash* /home/wine/ && \
    mkdir -p /home/wine/.wine/drive_c/windows/Fonts && \
    cp /usr/share/fonts/vlgothic/*.ttf /home/wine/.wine/drive_c/windows/Fonts/ && \
    chown wine:wine /home/wine -R

# for quick check
#RUN dnf install -y --disablerepo=* --enablerepo=fedora xorg-x11-apps

USER wine
ENV HOME="/home/wine" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/wine

CMD /bin/bash
