#!/bin/env bash
# Using the Gkeep.nvim plugin

read mail < ~/Scripts/Programs/variables/mail
alacritty -e nvim \
    --cmd "autocmd VimEnter * GkeepLogin $mail" \
    --cmd "autocmd VimEnter * GkeepOpen"
