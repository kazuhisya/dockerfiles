# vi: set ft=dockerfile :

FROM docker.io/fedora:29
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV TZ="JST-9" \
    BOOSTNOTE_VERSION="0.11.12"

RUN dnf install -y --setopt=tsflags=nodocs \
    rpm-build git sudo
RUN useradd -m mock && chown mock.mock -R /home/mock && \
    echo "mock  ALL=(ALL)   NOPASSWD: ALL" > /etc/sudoers.d/mock

USER mock
WORKDIR /home/mock

ADD https://github.com/BoostIO/boost-releases/releases/download/v${BOOSTNOTE_VERSION}/boostnote_${BOOSTNOTE_VERSION}_amd64.deb /home/mock/boostnote.deb
ADD boostnote.spec /home/mock/boostnote.spec


RUN sudo chown mock.mock boostnote.* && sudo chmod 644 boostnote.* && \
    ar vx boostnote.deb && \
    mv data.tar.xz boostnote-${BOOSTNOTE_VERSION}.tar.gz && \
    mkdir -p rpmbuild/SOURCES && \
    mv boostnote-${BOOSTNOTE_VERSION}.tar.gz rpmbuild/SOURCES/
RUN rpmbuild -ba boostnote.spec
