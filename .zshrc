#!/bin/zsh
# echo ".zshrc - enter"

# NOTE: ***** This file is sourced ONLY FOR INTERACTIVE SHELLS! *****
# The system won't source this file for non-interactive shells!  So, only interactive-terminal-related stuff can be here.

# All common bash/zsh aliases are in `~/.common.bash` which is sourced from `~/.zshenv` (always invoked)

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

# vi command-line editing mode
bindkey -v

# use sensible globbing (like csh nonomatch)
setopt csh_null_glob

# set prompt string
PS1='%50<>> ..<%~ > '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# echo ".zshrc - exit"
