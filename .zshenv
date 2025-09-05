#!/bin/zsh
# echo ".zshenv - enter"

# NOTE:  ***** This file is sourced for ALL shells (including non-interactive). *****

# common bash/zsh aliases
source ~/.common.bash

# local zsh config files
source_dir_suffix  ~/dotfiles-local    bash
source_dir_suffix  ~/dotfiles-local    zsh

source_dir_suffix  ~/dotfiles-private  bash
source_dir_suffix  ~/dotfiles-private  zsh

# zsh-specific aliases
alias dosrc="source ~/.zshenv ; source ~/.zshrc"

# echo ".zshenv - exit"
