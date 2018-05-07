#!/bin/sh

docker rmi $(docker images local/fc28 -q)
for name in dev-tools
do
    docker build -t local/fc28:${name} -f ./Dockerfile-${name} .
done
