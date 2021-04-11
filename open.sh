#!/bin/bash
#                                          Check                                           #
[[ '$1' = '' ]] && ( echo "Please provide path and file"; exit ) || FULL_FILE=$1

#                                    Get File Extensions                                   #
FILE=$(basename -- "$FULL_FILE") # File name and extension
LAST_EXT="${FILE##*.}" # Outputs the extension
SHEBANG=$( head -c 3 $1 ) # reads the first 2 characters in a file to look for a shebang
#DOUBLE_EXT="${FILE#*.}" # outputs double extensions without filename
#FILE_PLUS_FIRST_EXT="$FILE%.*" # If double extension ouptuts filename and first extension
#FILE_NAME="${FILE%%.*}" # Only filename, without extension

#                                   Default Applications                                   #
TEXT_EDITOR="nvim"
VIDEO_VIEWER="devour mpv"
PIC_VIEWER="devour sxiv -s f"
PIC_EDITOR="devour gimp"
PROGRAM_EDITOR="nvim"
PDF_VIEWER="devour zathura"
ORG_VIEWER="emacs"
CRAP_EDITOR="libreoffice"

#                                       Run commands                                       #
case $LAST_EXT in
     org )
         $ORG_VIEWER $1 ;;
     jpg | png | svg | bmp )
        $PIC_VIEWER $1 ;;
     pdf )
         $PDF_VIEWER $1 ;;
     docx )
         $CRAP_EDITOR $1 ;;
     tex | text | txt )
         $TEXT_EDITOR $1 ;;
     mp4 | mpv | mov | avi | mkv | webm )
         $VIDEO_VIEWER $1 ;;
     blend )
         blender $1 ;;
     py | sh | h | c | cpp | vim )
         $PROGRAM_EDITOR $1 ;;
#     pacfile )
#        notify-send "Updating system and installing applications from the list: $1" &&
#        sudo pacman -Syyu < $1 &&
#        notify-send "Installation Completed" ;;
      zprofile )
         $PROGRAM_EDITOR $1 ;;
     * )
     [[ "$SHEBANG" = "#!/" ]] && ( nvim $1 ) || ( notify-send ".$LAST_EXT is not a defined extension in ~/.local/bin/open.sh" && exit 1 ) ;;
esac
