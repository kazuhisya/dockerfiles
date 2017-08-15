# vi: set ft=dockerfile :

FROM docker.io/fedora:26
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV TZ="JST-9"

RUN dnf install -y --setopt=tsflags=nodocs \
    nodejs nodejs-grunt \
    dpkg dpkg-dev fakeroot \
    rpm-build git

RUN git clone --depth 1 https://github.com/BoostIO/Boostnote /boostnote
ADD https://github.com/kazuhisya/Boostnote/commit/b6304a04e68bfbcdf44d2280bb2c6680d8abbca3.diff /boostnote/b6304a04e68bfbcdf44d2280bb2c6680d8abbca3.diff
RUN useradd -m mock && chown -R mock.mock /boostnote
USER mock
WORKDIR /boostnote

RUN patch -u < b6304a04e68bfbcdf44d2280bb2c6680d8abbca3.diff
RUN npm install
RUN grunt build
