#!/usr/bin/sh

export WALL_PATH=$HOME/Pictures/Wallpapers
FILE_NAME=$(date +'%F')'.jpg'

mkdir -p ${WALL_PATH}

curl http://bing.com$(curl -s http://www.bing.com/HPImageArchive.aspx\?format\=js\&idx\=0\&n\=1 | jq -r '.images[0].url') > ${WALL_PATH}/${FILE_NAME}

swaymsg output "*" background ${WALL_PATH}/${FILE_NAME} fill
