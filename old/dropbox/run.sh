#!/bin/bash
docker run \
    -itd \
    --name=drbox \
    --rm \
    -v ${PWD}/data-dropbox:/root/Dropbox:z \
    -v ${PWD}/dot-dropbox:/root/.dropbox:z \
    local/dbox
