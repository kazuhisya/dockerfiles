#!/bin/sh
time docker build -t local/albert .
docker run -it --name albert local/albert true
docker cp albert:/root/rpmbuild/RPMS/x86_64 .
docker rm albert
