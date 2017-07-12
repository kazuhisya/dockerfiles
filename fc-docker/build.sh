#!/bin/sh

docker rmi $(docker images local/fc26 -q)
for name in dev-tools
do
    docker build -t local/fc26:${name} -f ./Dockerfile-${name} .
done
