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
SCRIPT_DATA="$SCRIPT_PATH/data"
LIST=$SCRIPT_PATH/bookmarks-list

#BOOKMARKS=$($LIST | dmenu -l 10 -sb darkgreen -sf black -p "Search Bookmarks")
BOOKMARKS=$($LIST | dmenu -c -l 20 -p "Search Bookmarks")

if [[ ! "$BOOKMARKS" = "" ]]; then
    if [[ "$1" = "q" ]]; then
        setsid qutebrowser $BOOKMARKS &
    elif [[ "$1" = "f" ]]; then
        setsid firefox $BOOKMARKS &
    elif [[ "$1" = "b" ]]; then
        setsid brave $BOOKMARKS &
    elif [[ "$1" = "" ]]; then
       setsid qutebrowser $BOOKMARKS &
    fi
else
    exit
fi
