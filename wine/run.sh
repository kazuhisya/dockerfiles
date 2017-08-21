#!/bin/bash
docker run -ti --rm \
  -e XMODIFIERS="@im=ibus" \
  -e GTK_IM_MODULE=ibus \
  -e QT_IM_MODULE=ibus \
  -e XIMPROGRAM=ibus \
  -e LC_CTYPE=ja_JP.UTF-8 \
  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
  local/wine:base
