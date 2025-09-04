#!/bin/bash
# echo ".bashrc - enter"
#
# NOTE: ***** This file is sourced ONLY FOR INTERACTIVE NON-LOGIN SHELLS *****

# Needed so non-interactive bash shells (i.e. shells not connected to a terminal) 
# will source `~/.common.bash` (see `man bash`)
export BASH_ENV=~/.common.bash

# common bash/zsh aliases
source ~/.common.bash
#
# local bash config files
source_dir_suffix  ~/dotfiles-local  bash
source_dir_suffix  ~/dotfiles-alan   bash
source_dir_suffix  ~/dotfiles-nooop  bash

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

