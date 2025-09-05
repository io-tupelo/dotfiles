#!/bin/bash
# NOTE: ***** This file is sourced ONLY FOR INTERACTIVE LOGIN SHELLS *****

# We want all the same aliases, paths, etc available for interactive non-login shells.
# So, all bash config stuff is in ~/.bashrc
source ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

