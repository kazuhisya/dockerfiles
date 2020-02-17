#!/bin/bash

# selinux label
sudo chcon -Rt svirt_sandbox_file_t ./share

# docker run
docker run -ti --rm \
  -e XMODIFIERS="@im=ibus" \
  -e GTK_IM_MODULE=ibus \
  -e QT_IM_MODULE=ibus \
  -e XIMPROGRAM=ibus \
  -e LC_CTYPE=ja_JP.UTF-8 \
  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --user=$(id -u):$(id -g) \
  --userns=keep-id \
  --security-opt label=type:container_runtime_t \
  --device /dev/snd \
  -v /run/user/`id -u`/pulse/native:/run/user/`id -u`/pulse/native:z \
  -v ~/.Xauthority:/home/wine/.Xauthority:z,rw \
  -v `pwd`/share:/home/wine/shared_directory:z \
  local/wine:base
