#!/bin/zsh
# echo ".zshrc - enter"

# NOTE: ***** This file is sourced ONLY FOR INTERACTIVE SHELLS! *****
# The system won't source this file for non-interactive shells!  
# So, only put interactive-terminal-related stuff here.

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
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
 
# echo ".zshrc - exit"
#sledge:binary path
export SLEDGE_BIN=/Users/vn5aap1/.sledge/bin
export PATH="${PATH}:${SLEDGE_BIN}"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/vn582dt/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Added by Code Puppy installer on Thu May 21 07:39:19 PDT 2026
alias code-puppy="$HOME/.code-puppy-venv/bin/code-puppy"

# Added by Wibey CLI installation
export BUN_INSTALL_CACHE_DIR="/Users/vn582dt/.local/share/bun/cache"

# Added by Wibey CLI installation
export PATH="$HOME/.local/bin:$PATH"

