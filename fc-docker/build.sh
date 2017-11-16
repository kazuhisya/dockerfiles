#!/bin/sh

docker rmi $(docker images local/fc27 -q)
for name in dev-tools
do
    docker build -t local/fc27:${name} -f ./Dockerfile-${name} .
done
