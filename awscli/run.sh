#!/bin/bash
docker run \
    -it \
    --name=aws \
    --rm \
    -v ${PWD}/.aws:/root/.aws:z \
    local/aws
