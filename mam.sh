#!/bin/sh

manual=$(apropos -s ${SECTION:-''} ${@:-.} | \
    grep -v -E '^.+ \(0\)' |\
    awk '{print $2 "    " $1}' | \
    sort | \
    rofi -dmenu -i -font 'Hack 14' -p "Manual: " | \
    sed -E 's/^\((.+)\)/\1/')

if [ -z "$MANUAL" ]; then 
  man -T${FORMAT:-pdf} $manual | ${READER:-zathura -}
fi
