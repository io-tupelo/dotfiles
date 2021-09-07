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

# ***** set => true for tigergraph *****
if false; then
  export USER=tigergraph
  export PATH=/home/tigergraph/tigergraph/app/cmd:$PATH
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi

# echo ".bashrc - exit"

