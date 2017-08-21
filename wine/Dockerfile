# vi: set ft=dockerfile :

FROM fedora:26
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN dnf install -y --setopt=tsflags=nodocs dnf-plugins-core && \
    dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/26/winehq.repo && \
    dnf install -y --setopt=tsflags=nodocs \
        winehq-devel sudo bash bash-completion \
        vlgothic-fonts vlgothic-p-fonts && \
    rm -rf /opt/wine-devel/share/wine/fonts/tahoma*

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/wineuser && \
    echo "wineuser:x:${uid}:${gid}:Developer,,,:/home/wineuser:/bin/bash" >> /etc/passwd && \
    echo "wineuser:x:${uid}:" >> /etc/group && \
    echo "wineuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wineuser && \
    chmod 0440 /etc/sudoers.d/wineuser && \
    cp /etc/skel/.bash* /home/wineuser/
COPY user.reg /home/wineuser/.wine/user.reg
RUN chown wineuser.wineuser /home/wineuser -R

USER wineuser
ENV HOME="/home/wineuser" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/wineuser
RUN mkdir -p /home/wineuser/.wine/drive_c/windows/Fonts && \
    cp /usr/share/fonts/vlgothic/*.ttf /home/wineuser/.wine/drive_c/windows/Fonts/ && \
    chown wineuser.wineuser /home/wineuser/.wine -R

CMD /bin/bash
