# vi: set ft=dockerfile :

FROM alpine:3.11
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

# env
ENV TZ="JST-9"

# apk
RUN apk update && \
    apk add python3 bash curl groff vim jq && \
    rm -rf /var/cache/apk/*

# pip
RUN pip3 install awscli
RUN echo "complete -C '/usr/bin/aws_completer' aws" >> /root/.bashrc

VOLUME ["/root/.aws"]
WORKDIR /root
CMD ["bash"]
