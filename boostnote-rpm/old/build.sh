#!/bin/sh
time docker build -t local/boostnote .
docker run -it --name boostnote local/boostnote true
docker cp boostnote:/home/mock/rpmbuild/RPMS/x86_64 .
docker rm boostnote
