#!/bin/env bash

time=$(date +'%d %m %y %H %M %S')
filetimestamp=$(date +'%m')
foldertimestamp=$(date +'%Y')
filepath="$HOME/Documents/Worktime"
previousfile=$((filetimestamp-1))
previousmonth=$((foldertimestamp-1))


if [[ ! -d "$filepath/$foldertimestamp" ]]; then
    archivepath="$filepath/$foldertimestamp"
    mkdir -p "$archivepath"
fi

if [[ -f "$filepath/$filetimestamp.dat" ]]; then
    timesheet="$filepath/$filetimestamp.dat"
elif [[ ! -f "$filepath/$filetimestamp.dat" ]]; then
    touch "$filepath/$filetimestamp.dat"
    if [[ "$previousfile" = "0" ]]; then
        if [[ "$previousmonth"="1" ]] || [[ "$previousmonth"="3" ]] || [[ "$previousmonth"="5" ]] || [[ "$previousmonth"="7" ]] || [[ "$previousmonth"="8" ]] || [[ "$previousmonth"="10" ]]; then
            previousfile="31"
            $previousmonth-=1
        elif [[ "$previousmonth"="4" ]] || [[ "$previousmonth"="6" ]] || [[ "$previousmonth"="9" ]] || [[ "$previousmonth"="11" ]]; then
            previousfile="30"
            $previousmonth-=1
        elif [[ "$previousmonth"="2" ]]; then
            previousfile="28"
            $previousmonth-=1
        fi
    fi
    if [[ "$previousmonth"=0 ]]; then
        previousfile="31"
        previousmonth="12"
    fi
    mv "$filepath/$previousfile.dat" "$archivepath/"
    timesheet="$filepath/$filetimestamp.dat"
fi

lastreg=$( awk '{w=$1} END{print w}' "$timesheet" )

# TODO create new file each month
# TODO move to archive after month is finished
# TODO add check for missing out the month before

if [[ "$lastreg" = "" ]]; then
    printf '%s\n' "in $time" >> "$timesheet"
elif [[ ! "$lastreg" = "in" ]]; then
    printf '%s\n' "in $time" >> "$timesheet"
    python "$HOME/Scripts/Programs/assorted-scripts/workhours_disp.py" -f "$timesheet"
elif [[ "$lastreg" = "in" ]]; then
    ( printf '%s\n' "ut $time" >> "$timesheet" )
fi

#bat "$timesheet"
