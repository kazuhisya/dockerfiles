#!/bin/bash
docker run \
    --name redmine \
    -itd \
    -v ${PWD}/.redminedata/data:/var/lib/redmine/data \
    -v ${PWD}/.redminedata/files:/var/lib/redmine/files \
    -p 8080:3000 \
    local/redmine
