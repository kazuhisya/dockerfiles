#!/bin/bash
docker run \
    --name redmine \
    -itd \
    -p 8080:3000 \
    local/redmine
