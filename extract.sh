#!/bin/bash
#                                          Check                                           #
[[ '$1' = '' ]] && ( echo "Please provide path and file"; exit ) || FULL_FILE=$1

#                                    Get File Extensions                                   #
FILE=$(basename -- "$FULL_FILE") # File name and extension
LAST_EXT="${FILE##*.}" # Outputs the extension
#SHEBANG=$( head -c 3 $1 ) # reads the first 2 characters in a file to look for a shebang
#DOUBLE_EXT="${FILE#*.}" # outputs double extensions without filename
#FILE_PLUS_FIRST_EXT="$FILE%.*" # If double extension ouptuts filename and first extension
#FILE_NAME="${FILE%%.*}" # Only filename, without extension

#                                   Default Applications                                   #
TAR="tar xvzf"
ZIP="unzip"
RAR="unrar e"
JAR="jar -xf"

#                                       Run commands                                       #
case $LAST_EXT in
     tar | gz | bz | bz2 | tgz | zx )
        $TAR $1 ;;
     zip )
        $ZIP $1 ;;
     rar )
        $RAR $1 ;;
     jar )
        $JAR $1 ;;
     * )
     echo "No protocols in script to handle this file" ;;
esac
