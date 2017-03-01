#!/bin/sh

docker rmi $(docker images local/fc25 -q)
for name in dev-tools
do
    docker build -t local/fc25:${name} -f ./Dockerfile-${name} .
done
