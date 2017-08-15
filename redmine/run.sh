#!/bin/bash
docker run \
    --name redmine \
    -it \
    -p 8080:3000 \
    local/redmine
