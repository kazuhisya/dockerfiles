#!/bin/sh
time docker build -t local/cutemarked .
docker run -it --name cutemarked local/cutemarked true
docker cp cutemarked:/root/rpmbuild/RPMS/x86_64 .
docker rm cutemarked
