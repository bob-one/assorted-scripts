#!/bin/env bash
ATTR="\e[1;32m"
DESC="\e[0;32m"
EXSP="\e[0;33m"
NOCO="\e[0m"
BOOKMARKS="$HOME/Scripts/Programs/assorted-scripts/bookmarks/bookmarks-list"
[[ "$1" = "a" ]] && ( echo "echo $2" >> $BOOKMARKS; exit )
if [[ "$1" = "r" ]]; then
    bat -l sublime-syntax $BOOKMARKS
fi
if [[ "$1" = "d" ]]; then
    if [[ "$2" = "" ]]; then
        echo "" > $BOOKMARKS
    elif [[ "$2" =~ ^[+-]?[0-9]+$ ]]; then
        sed -i -e "$2d" $BOOKMARKS
    else
        exit
    fi
fi
[[ "$1" = "h" ]] && ( echo -e "$ATTR  a:      $DESC add bookmark                   $EXSP  Example:    b a      Some Text in quotation marks
$ATTR  d:      $DESC delete everything          $EXSP  Example:    b d      Deletes everything
$ATTR  d n:    $DESC delete specific line       $EXSP  Example:    b d 10   Deletes line n (in this case line 10)
$ATTR  r:      $DESC show all notes             $EXSP  Example:    b r      List all the bookmarks
$ATTR  h:      $DESC show list of attributes    $EXSP  Example:    b h      Show help$NOCO" )
