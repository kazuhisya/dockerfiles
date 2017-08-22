# vi: set ft=dockerfile :

FROM fedora:26
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN dnf install -y --setopt=tsflags=nodocs \
        wine winetricks sudo bash bash-completion \
        glibc-langpack-ja glibc-locale-source \
        vlgothic-fonts vlgothic-p-fonts && \
        rm -rf /var/cache/yum && rm -rf /var/cache/dnf

RUN localedef -i ja_JP -f UTF-8 ja_JP.UTF-8 | true && \
    export uid=1000 gid=1000 && \
    mkdir -p /home/wineuser && \
    echo "wineuser:x:${uid}:${gid}:Developer,,,:/home/wineuser:/bin/bash" >> /etc/passwd && \
    echo "wineuser:x:${uid}:" >> /etc/group && \
    echo "wineuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wineuser && \
    chmod 0440 /etc/sudoers.d/wineuser && \
    cp /etc/skel/.bash* /home/wineuser/
RUN chown wineuser.wineuser /home/wineuser -R

USER wineuser
ENV HOME="/home/wineuser" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/wineuser
RUN mkdir -p /home/wineuser/.wine/drive_c/windows/Fonts && \
    cp /usr/share/fonts/vlgothic/*.ttf /home/wineuser/.wine/drive_c/windows/Fonts/ && \
    chown wineuser.wineuser /home/wineuser/.wine -R

CMD /bin/bash
