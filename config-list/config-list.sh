#!/bin/env bash

# Get the path to where this script is run from and asigning it the the variable $SCRIPT_PATH
# In case it's a symlink: Resolve $SOURCE until the it's no longer a symlink
# If $SOURCE was a relative symlink, resolve it relative to the path where the symlink was located
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    SCRIPT_PATH="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$SCRIPT_PATH/$SOURCE"
done

SCRIPT_PATH="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
LIST=$SCRIPT_PATH/config-list

#BOOKMARKS=$($LIST | dmenu -c -l 20 -sb "#222222" -sf yellow -p "Search Bookmarks" | awk '{print $2}')
CONFIG=$($LIST | dmenu -c -l 20 -p "Search configs" | awk '{print $2}')
#BOOKMARKS=$($LIST | dmenu -sb "#222222" -sf yellow -p "Search Bookmarks" | awk '{print $2}')

if [[ ! "$CONFIG" = "" ]]; then
    alacritty -e nvim $CONFIG
else
    exit
fi
