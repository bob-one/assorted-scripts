#!/bin/sh
# just a renaming of HiPhish's script Macho
# Blogpost:
# https:/hiphish.github.io/blog/2020/05/31/macho-man-command-on-steroids/

manual=$(apropos -s ${SECTION:-''} ${@:-.} | \
    grep -v -E '^.+ \(0\)' |\
    awk '{print $2 "    " $1}' | \
    sort | \
#    rofi -dmenu -i -font 'Hack 14' -p "Manual: " | \
    dmenu -i -l 20 -p "Manual: " | \
    sed -E 's/^\((.+)\)/\1/')

if [ "$MANUAL" == "" ]; then
    exit 0
elif [ -z "$MANUAL" ]; then 
  man -T${FORMAT:-pdf} $manual | ${READER:-zathura -}
fi
