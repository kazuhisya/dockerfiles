# vi: set ft=dockerfile :

FROM local/fc28:dev-tools
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV TZ="JST-9" \
    CVERSION="0.11.3"

WORKDIR /root/rpmbuild
RUN rpmdev-setuptree
COPY cutemarked.spec /root/rpmbuild/SPECS/cutemarked.spec
RUN dnf builddep --nogpgcheck --setopt=tsflags=nodocs -y ./SPECS/cutemarked.spec
RUN curl -OL https://github.com/cloose/CuteMarkEd/archive/v${CVERSION}.tar.gz && \
    tar xf v${CVERSION}.tar.gz && \
    mv CuteMarkEd-${CVERSION} cutemarked-${CVERSION} && \
    tar -zcf cutemarked-${CVERSION}.tar.gz cutemarked-${CVERSION} && \
    rm -rf cutemarked-${CVERSION} && \
    mv cutemarked-${CVERSION}.tar.gz ./SOURCES/
RUN rm -rf ~/.rpmmacros && rpmbuild -ba ./SPECS/cutemarked.spec
