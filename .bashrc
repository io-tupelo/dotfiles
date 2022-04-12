#!/bin/bash
# echo ".bashrc - enter"

# Needed so non-interactive bash shells will source `~/.common.bash` (see `man bash`)
export BASH_ENV=~/.common.bash

# common bash/zsh aliases
source ~/.common.bash

# vi command-line editing mode
set -o vi  

# use sensible globbing (like csh nonomatch)
shopt -s nullglob

# set prompt string
PS1='\w > '
PROMPT_DIRTRIM=4

# bash-specific aliases
alias dosrc="source ~/.bashrc"

# ********* vvv Automatically added by NVM installer vvv ********* 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# echo ".bashrc - exit"

