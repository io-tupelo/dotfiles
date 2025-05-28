#!/bin/zsh
# echo ".zshenv - enter"
# This file is sourced for all shells (including non-interactive)

# common bash/zsh aliases
source ~/.common.bash

# local zsh config files
echo "dotfiles-local:  enter"
if [ -e ~/dotfiles-local ]; then
  echo "found:"   ~/dotfiles-local
  for ff in $(find ${HOME}/dotfiles-local -iname "*.zsh") ; do
    echo "file: ${ff}"
    source ${ff}
  done 
else
  echo "NOT FOUND:"  ~/dotfiles-local
fi
echo "dotfiles-local:  leave"

# echo ".zshenv - exit"
