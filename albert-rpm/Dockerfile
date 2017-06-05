# vi: set ft=dockerfile :

FROM local/fc25:dev-tools
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV TZ="JST-9" \
    ALBERT="0.11.3"

RUN dnf install -y cmake qt5-qtbase qt5-qttools qt5-qtbase-devel qt5-qtx11extras-devel muParser-devel qt5-qtsvg-devel
COPY albert.spec ./
RUN spectool -g ./albert.spec
RUN rpmdev-setuptree && \
    mv albert-${ALBERT}.tar.gz ~/rpmbuild/SOURCES/ && \
    dnf builddep -y ./albert.spec --setopt=tsflags=nodocs
RUN rpmbuild -ba ./albert.spec
