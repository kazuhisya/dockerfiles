# vi: set ft=dockerfile :

FROM registry.fedoraproject.org/fedora-minimal:32
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

# env
ENV TZ="JST-9" \
    LANG="en_US.UTF-8"

# microdnf
# This mkdir is workaround for microdnf
# https://github.com/rpm-software-management/microdnf/issues/50#issuecomment-559137747
RUN mkdir -p /run/user/$UID && \
    microdnf install --nodocs unar && \
    microdnf clean all

WORKDIR /root/share


VOLUME ["/root/share"]

CMD ["bash"]
