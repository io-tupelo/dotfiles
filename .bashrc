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

# local bash config files
for ff in $(find ~/dotfiles-local -iname "*.bash") ; do
  source ${ff}
done 

# echo ".bashrc - exit"

