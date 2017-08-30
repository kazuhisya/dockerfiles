#!/bin/bash
docker run \
    --name gitbucket \
    -itd \
    -v ${PWD}/.gitbucket:/opt/.gitbucket \
    -p 8080:8080 \
    local/gitbucket
