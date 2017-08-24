#!/bin/bash
docker run -ti --rm \
  -e XMODIFIERS="@im=ibus" \
  -e GTK_IM_MODULE=ibus \
  -e QT_IM_MODULE=ibus \
  -e XIMPROGRAM=ibus \
  -e LC_CTYPE=ja_JP.UTF-8 \
  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v ~/.Xauthority:/home/wine/.Xauthority \
  -v /dev/snd:/dev/snd --privileged \
  -v /run/user/`id -u`/pulse/native:/run/user/`id -u`/pulse/native \
  -v `pwd`/share:/home/wine/shared_directory \
  local/wine:base
