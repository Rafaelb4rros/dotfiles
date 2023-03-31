#!/bin/sh

#https://whhone.com/posts/automating-i3-scratchpad-setup/

if [ $# -ne 2 ]; then
    echo "Usage: "${0}" <i3_mark> <launch_cmd>"
    echo "Example: ${0} 'scratch-emacs' 'emacsclient -c -a emacs'"
    exit 1
fi

I3_MARK=${1}
LAUNCH_CMD=${2}

scratchpad_show() {
    i3-msg "[con_mark=${I3_MARK}]" border none
    i3-msg "[con_mark=${I3_MARK}]" resize set width 1200
    i3-msg "[con_mark=${I3_MARK}]" resize set height 900
    i3-msg "[con_mark=${I3_MARK}]" scratchpad show
}

if ! scratchpad_show; then
    eval "${LAUNCH_CMD}" &
    i3-msg -t subscribe  '[ "window" ]'
    i3-msg mark ${I3_MARK}
    i3-msg move scratchpad
    scratchpad_show
fi
