#!/bin/sh

docker rmi $(docker images local/fc29 -q)
for name in dev-tools
do
    docker build -t local/fc29:${name} -f ./Dockerfile-${name} .
done
