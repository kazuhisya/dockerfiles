#!/bin/bash

# selinux label
sudo chcon -Rt container_file_t ./share

# podman run
podman run -ti --rm \
  --userns=keep-id \
  -e XMODIFIERS="@im=ibus" \
  -e GTK_IM_MODULE=ibus \
  -e QT_IM_MODULE=ibus \
  -e XIMPROGRAM=ibus \
  -e LC_CTYPE=ja_JP.UTF-8 \
  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --user=$(id -u):$(id -g) \
  --security-opt label=type:container_runtime_t \
  --device /dev/snd \
  -v /run/user/`id -u`/pulse/native:/run/user/`id -u`/pulse/native:z \
  -v /run/user/`id -u`/gdm/Xauthority:/home/java/.Xauthority:z,rw \
  -v `pwd`/share:/home/java/shared_directory:z \
  local/x11:java-rhel6
