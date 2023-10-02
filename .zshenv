#!/bin/zsh
# echo ".zshenv - enter"
# This file is sourced for all shells (including non-interactive)

# common bash/zsh aliases
source ~/.common.bash

# local zsh config files
for ff in $(find ~/dotfiles-local -iname "*.zsh") ; do
  source ${ff}
done 

# echo ".zshenv - exit"
