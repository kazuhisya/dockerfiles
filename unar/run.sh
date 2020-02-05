#!/bin/bash
docker run \
    -it \
    --name=unar \
    --rm \
    -v ${PWD}/share:/root/share:z \
    local/unar \
    bash
