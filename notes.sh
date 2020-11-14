#!/bin/env bash
ATTR="\e[1;32m"
DESC="\e[0;32m"
EXSP="\e[0;33m"
NOCO="\e[0m"
NOTES="$HOME/Documents/Notes/Notes"
[[ "$1" = "a" ]] && ( echo "$2" >> $NOTES; exit )
[[ "$1" = "at" ]] && ( echo "TODO: $2" >> $NOTES; exit )
[[ "$1" = "ap" ]] && ( echo "PRI: $2" >> $NOTES; exit )
[[ "$1" = "af" ]] && ( echo "FIXME: $2" >> $NOTES; exit )
[[ "$1" = "ai" ]] && ( echo "INFO: $2" >> $NOTES; exit )
if [[ "$1" = "r" ]]; then
    bat -l sublime-syntax $NOTES
fi
if [[ "$1" = "d" ]]; then
    if [[ "$2" = "" ]]; then
        echo "" > $NOTES
    elif [[ "$2" =~ ^[+-]?[0-9]+$ ]]; then
        sed -i -e "$2d" $NOTES
    else
        exit
    fi
fi
[[ "$1" = "h" ]] && ( echo -e "$ATTR  a:      $DESC add note                   $EXSP  Example:    n a      Some Text in quotation marks
$ATTR  at:     $DESC add note with TODO:        $EXSP  Example:    n at     Some Text in quotation marks
$ATTR  ap:     $DESC add note with PRI:         $EXSP  Example:    n at     Some Text in quotation marks
$ATTR  af:     $DESC add note with FIXME:       $EXSP  Example:    n at     Some Text in quotation marks
$ATTR  ai:     $DESC add note with INFO:        $EXSP  Example:    n at     Some Text in quotation marks
$ATTR  d:      $DESC delete everything          $EXSP  Example:    n d      Deletes everything
$ATTR  d n:    $DESC delete specific line       $EXSP  Example:    n d 10   Deletes line n (in this case line 10)
$ATTR  r:      $DESC show all notes             $EXSP  Example:    n r      List all the notes
$ATTR  h:      $DESC show list of attributes    $EXSP  Example:    n h      Show help$NOCO" )
