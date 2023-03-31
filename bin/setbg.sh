#!/bin/bash

PIDFILE="/var/run/user/$UID/bg.pid"

declare -a PIDs

 #--vo=vdpau --hwdec=vdpau \
_screen() {
    xwinwrap -ov -ni -g "$1" -- mpv --fullscreen\
        --no-stop-screensaver \
        --hwdec \
        --loop-playlist --shuffle --no-osc --no-audio --no-osd-bar -wid %WID --no-input-default-bindings \
        "$2" &
    PIDs+=($!)
}

while read p; do
  [[ $(ps -p "$p" -o comm=) == "xwinwrap" ]] && kill -9 "$p";
done < $PIDFILE

sleep 0.5

for i in $( xrandr -q | grep ' connected' | grep -oP '\d+x\d+\+\d+\+\d+')
do
    _screen "$i" "$1" $2
done

printf "%s\n" "${PIDs[@]}" > $PIDFILE
