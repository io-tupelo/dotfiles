#!/bin/zsh
# echo ".zshenv - enter"
# This file is sourced for all shells (including non-interactive)

# common bash/zsh aliases
source ~/.common.bash

# local zsh config files
### echo ".zshenv - dotfiles-local:  enter"
mkdir -p ~/dotfiles-local 
for ff in $(find ${HOME}/dotfiles-local -iname "*.zsh") ; do
  ### echo "  source ${ff}"
  source ${ff}
done 
### echo ".zshenv - dotfiles-local:  leave"

# echo ".zshenv - exit"
