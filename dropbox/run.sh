#!/bin/bash
docker run \
    -itd \
    --name=drbox \
    --rm \
    -v ${PWD}/data-dropbox:/root/Dropbox \
    -v ${PWD}/dot-dropbox:/root/.dropbox \
    local/dbox
