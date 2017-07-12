# vi: set ft=dockerfile :

FROM local/fc26:dev-tools
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV TZ="JST-9" \
    ORIG_SRPM="cutemarked-0.11.3-1.1.src.rpm"

WORKDIR /work
RUN curl -OL "http://download.opensuse.org/repositories/home:/cloose1974/Fedora_23/src/${ORIG_SRPM}"

RUN dnf builddep -y ./${ORIG_SRPM} --nogpgcheck --setopt=tsflags=nodocs && \
    rpmbuild --rebuild ./${ORIG_SRPM}
