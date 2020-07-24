# vi: set ft=dockerfile :

FROM fedora:32
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

RUN dnf install -y --setopt=tsflags=nodocs \
        --disablerepo=* --enablerepo=fedora,updates \
        sudo bash bash-completion procps-ng \
        glibc-langpack-ja findutils \
        polkit unzip unar wget xdg-utils xz \
        vlgothic-fonts vlgothic-p-fonts \
        openssh-clients openssh-askpass virt-manager && \
    rm -rf /var/cache/yum && rm -rf /var/cache/dnf

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    useradd x11-user && \
    echo "x11-user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/x11-user && \
    chmod 0440 /etc/sudoers.d/x11-user && \
    cp /etc/skel/.bash* /home/x11-user/ && \
    chown x11-user:x11-user /home/x11-user -R

# for quick check
#RUN dnf install -y --disablerepo=* --enablerepo=fedora xorg-x11-apps

USER x11-user
ENV HOME="/home/x11-user" \
    LANG="ja_JP.UTF-8"
WORKDIR /home/x11-user

CMD /bin/bash
