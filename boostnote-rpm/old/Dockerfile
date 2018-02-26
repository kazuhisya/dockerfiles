# vi: set ft=dockerfile :

FROM docker.io/fedora:27
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV TZ="JST-9" \
    BOOSTNOTE_VERSION="0.10.0"

RUN dnf install -y --setopt=tsflags=nodocs \
    rpm-build git

ADD https://github.com/BoostIO/boost-releases/releases/download/v${BOOSTNOTE_VERSION}/boostnote_${BOOSTNOTE_VERSION}_amd64.deb /home/mock/boostnote.deb
ADD boostnote.spec /home/mock/boostnote.spec

RUN useradd -m mock && chown mock.mock -R /home/mock
USER mock
WORKDIR /home/mock

RUN ar vx boostnote.deb && \
    mv data.tar.xz boostnote-${BOOSTNOTE_VERSION}.tar.gz && \
    mkdir -p rpmbuild/SOURCES && \
    mv boostnote-${BOOSTNOTE_VERSION}.tar.gz rpmbuild/SOURCES/
RUN rpmbuild -ba boostnote.spec
