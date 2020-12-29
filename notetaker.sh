#!/bin/sh

MD_NOTE="$HOME/Documents/Notes/markdowns/note-$(date +%y%m%d).md"
PDF_NOTE="$HOME/Documents/Notes/pdf/note-$(date +%y%m%d).pdf"

if [[ "$1" = "v" ]]; then
    zathura $PDF_NOTE
    exit
else
    [[ ! -f $MD_NOTE ]] && ( echo -e "---\ntitle: Notater\ndate: $(date +%A-%d-%m-%y)\ngeometry: margin=3cm\n---" > $MD_NOTE)
    [[ ! -f $PDF_NOTE ]] && ( touch $PDF_NOTE)

    alacritty -t Notes -e nvim -c "norm G2o" \
         -c "norm Go## $(date +%H:%M:%S)" \
         -c "norm Go" \
         -c "norm zz" \
         -c "startinsert" $MD_NOTE
    
    pandoc -o $PDF_NOTE $MD_NOTE &
fi

# I make sure that ~/.local/bin/ or ~/.local/share/ is in my path
# and symlink it to one of these locations as n
# Then i add {'wname': 'Notes'}, to my floating_rules in the Qtile config
# now I can add it to a keybinding in sxhkd or call it from the terminal
# and open up a floating window, in vim, to take notes in using markdown
# and each new day a new file is created using that days date in the filename
# also each entry gets timestamped automatically inside the document
# I use the keybinding super n to open it in vim, and super shift n to view the pdf version of it
