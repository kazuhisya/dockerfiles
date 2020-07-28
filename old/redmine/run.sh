#!/bin/bash
docker run \
    --name redmine \
    -itd \
    -v ${PWD}/.redminedata/data:/var/lib/redmine/data:z \
    -v ${PWD}/.redminedata/files:/var/lib/redmine/files:z \
    -p 8080:3000 \
    local/redmine
