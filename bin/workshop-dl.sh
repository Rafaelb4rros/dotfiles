#!/bin/bash

WPP_ENGINE=431960
TEMP=/tmp/steamcontent
WPP_DIR="$HOME/Pictures/wallpapers/live"
WPP_ID=$1

steamcmd "+force_install_dir "$TEMP" +login login password +workshop_download_item "$WPP_ENGINE" "$WPP_ID" +quit"

cd $TEMP || { echo "Error"; exit 1; }

shopt -s globstar nullglob

for file in ./**/*.mp4; do
    mv "$file" "$WPP_DIR" && echo "Success $file"
done

rm -rf $TEMP
exit 0
