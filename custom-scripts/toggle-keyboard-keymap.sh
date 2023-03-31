IS_US_KEYMAP=`setxkbmap -print | grep us`

if [[ "x$IS_US_KEYMAP" != "x" ]]; then
    setxkbmap br;
else
    setxkbmap us;
fi



