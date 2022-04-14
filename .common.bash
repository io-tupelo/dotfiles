# echo "common.bash - enter"

# ***** NOTE *****:  In BASH a semicolon must terminate for 1-liner fns before closing brace!!! (not zsh)

function path_prepend {
  local path_search_dir=$1
  export PATH="${path_search_dir}:${PATH}"
}
function path_append {
  local path_search_dir=$1
  export PATH="${PATH}:${path_search_dir}"
}
function invokeEcho {
  echo $*
  $*
}
function evalEcho {
  echo $1
  eval $1
}
# function invokeEchoTime {
#   echo $*
#   time ( $* )
# }

export PATH=.
  path_prepend /bin
  path_prepend /usr/bin
  path_prepend /usr/local/bin
  path_prepend /usr/local/opt
  path_prepend /opt/bin
  path_prepend /opt/local/bin
  path_prepend ${HOME}/bin
  path_prepend ${HOME}/.bin
  path_prepend ${HOME}/opt/bin
  path_prepend ${HOME}/.local/bin
  path_append /usr/local/sbin
  path_append /usr/sbin
  path_append /sbin

function isMac() {
  # $(uname -a) => `Darwin athompson-ol.san.rr.com 19.6.0 Darwin Kernel Version 19.6.0: Tue Nov 10 # 00:10:30 PST 2020; root:xnu-6153.141.10~1/RELEASE_X86_64 x86_64`
  [[ $(uname -a) =~ "Darwin" ]] # returns true (0) or false (1)
}
function isLinux() {
  # $(uname -a) => `Linux ubuntu-focal 5.4.0-72-generic #80-Ubuntu SMP Mon Apr 12 17:35:00 UTC # 2021 x86_64 x86_64 x86_64 GNU/Linux`
  [[ $(uname -a) =~ "Linux"  ]] # returns true (0) or false (1)
}
#   sample 1-line usage (a bash "and list"; bash also supports the "or list" using `||`)
#     isLinux && echo "Found Linux"         <= equivalent to if/then expression
#     isMac   && echo "Found Darwin"        <= equivalent to if/then expression

# Shell type predicate fns
function isZsh() {
  [[ $ZSH_VERSION != "" ]] # returns true (0) or false (1)
}
function isBash() {
  [[ $BASH_VERSION != "" ]] # returns true (0) or false (1)
}

# Returns the shell type and version
function shellver() {
  if $(isZsh); then
    echo "  zsh $ZSH_VERSION"
  elif $(isBash); then
    echo "  bash $BASH_VERSION"
  else
    echo "  *** unknown shell ***"
  fi
}

# function configGVim {  # ***** why need this? *****
#   ff=/tmp/$$.out
#      *** unalias vim
#      *** unalias gvim
#   which gvim >& $ff
#   if [[ $(cat $ff) =~ "command not found" ]] ; then   # returns true (0) or false (1)
#     GVIM=vim
#   else
#     GVIM=$(which gvim)
#   fi
# }
# configGVim
# # echo "GVIM=${GVIM}"
# alias gvim=${GVIM}

umask 077   # disable access by group & world

###################################################################################################
# These need to be toward the top as they define ${lsColorFlag}, etc that is OS-dependent
if $(isLinux) ; then  source ~/.common-linux.bash   ; fi
if $(isMac)   ; then  source ~/.common-mac.bash     ; fi
#TODO  add windows version (for git bash)

###################################################################################################
alias da='   d *'
alias dal='  ls -ldF * | less'
alias dar='  d **/*'
alias dt9='  d -t * | head -9'
alias dt22=' d -t * | head -22'

alias d='    ls -ldF   ${lsColorFlag}'
alias lal='  ls -alF   ${lsColorFlag}'
alias ldl='  ls -ldF   ${lsColorFlag} .*'

# Always use egrep
alias grep=" \grep  -E --color=auto"  # same as deprecated 'egrep'
alias grepi="\grep -iE --color=auto"  # case insensitive

alias radirs="find . -type d "                                  # Recursive All Dirs
alias rdirs="radirs | grep -v '/\.' | sed -e 's/^..//' "        # Recursive Dirs
alias ldirs="find  * -maxdepth 0 -type d "                      # Local Dirs
alias lfiles="find * -maxdepth 0 -type f "                      # Local Files
alias dd='d $(ldirs) '                                          # d Dirs
alias ddr='d $(rdirs) '                                         # d Dirs Recursive

#TODO fix these => function with arg N
alias ddr2="find .  -maxdepth 2  -type d  | sed -e 's/^..//' | xargs ls -ldF ${lsColorFlag}"
alias ddr3="find .  -maxdepth 3  -type d  | sed -e 's/^..//' | xargs ls -ldF ${lsColorFlag}"
alias ddr4="find .  -maxdepth 4  -type d  | sed -e 's/^..//' | xargs ls -ldF ${lsColorFlag}"
alias ddr5="find .  -maxdepth 5  -type d  | sed -e 's/^..//' | xargs ls -ldF ${lsColorFlag}"
alias ddr6="find .  -maxdepth 6  -type d  | sed -e 's/^..//' | xargs ls -ldF ${lsColorFlag}"
alias ddr7="find .  -maxdepth 7  -type d  | sed -e 's/^..//' | xargs ls -ldF ${lsColorFlag}"

alias ddra='d $(radirs) '                                       # d Dirs Recursive All

alias du="du -m"
alias df="df -m"
alias dfs="df -m | grep -v '/snap/' | grep -v '^tmpfs'"

alias wcl="wc -l"       # Word Count Lines

alias hh="history -99"

alias gvt="~/work/settings/gvt.csh "
alias gvd="echo gvim -c 'winpos 5 5' -c 'winsize 170 50' "

#TODO fix these => function with arg N
alias up=" cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias up6="cd ../../../../../.."
alias up7="cd ../../../../../../.."
alias up8="cd ../../../../../../../.."
alias up9="cd ../../../../../../../../.."
alias rmdot='rmdir $(pwd)'

alias cuts="cut --char=-99"
alias cutm="cut --char=-155"
alias cutl="cut --char=-222"

#---------------------------------------------------------------------------------------------------
# To initialize a new user (*** WARNING - overwrites dest files! ***):
#   > cd                                                                    # go to home dir
#   > git clone  --bare  git@github.com:io-tupelo/dotfiles.git              # creates dir `dotfiles.git`
#   > alias dgit='git --git-dir=${HOME}/dotfiles.git --work-tree=${HOME}'   # define alias
#   > dgit reset --hard                                                     # use `dgit` to deploy files
#
alias dgit='git --git-dir=${HOME}/dotfiles.git --work-tree=${HOME}'
alias dgits='dgit status --short --branch'
alias dgitca='dgit commit --all'
alias dgitcam='dgit commit --all -m"misc" '
alias dgitcamp=" dgit commit --all -m'misc' ; dgit push"
alias dgitsy="dgit pull ; dgit push ; dgit push --tags"    # i.e. "git sync" (also pushes tags)
alias dgitdw="dgit diff --ignore-all-space --ignore-blank-lines"

#---------------------------------------------------------------------------------------------------
#TODO  convert to evalEcho
alias gits="    git status --short --branch"
alias gitb="    git branch"
alias gitco="   git checkout"
# alias gitmer="  git merge --no-ff --no-commit"
alias gitca="   git commit --all"
alias gitcam="  git commit --all -m'misc' "
alias gitcamp=" git commit --all -m'misc' ; git push"
alias gitsy="   git pull ; git push ; git push --tags"    # i.e. "git sync" (also pushes tags)
alias gitdns="  git diff --name-status"
alias gitdw="   git diff --ignore-all-space --ignore-blank-lines"
alias gitlg="   git log -22 --oneline --graph --decorate"
alias git-unadd='git reset HEAD'    # git unadd

#  usage:   gitg v9.3.1   # create a tag
#           gitg          # display all tags
function gitg {
  local tagStr=$1
  if [[ "$tagStr" == "" ]]; then
    git tag
  else
    git tag "$tagStr" -m"$tagStr"
  fi
}

# delete a tag from local and remote (origin)
function git-tag-delete {
  local tagStr=$1
  local remoteStr=$2
  if [[ $# == 0 ]]; then
    echo ""
    echo "  usage:  git-tag-delete <tag> [<remote-repo-name>]"
    echo ""
    return;
  fi
  if [[ "$remoteStr" == "" ]]; then
    remoteStr="origin"
  fi
  echo "  deleting tag '$tagStr' from local and remote ($remoteStr) repos..."
  echo ""
  git tag  --delete            $tagStr
  git push --delete $remoteStr $tagStr
}

function git-branch-current() {  # returns the name of the current branch
  git rev-parse --abbrev-ref HEAD
}
function git-branch-root() {
  if [[ $1 = "-h" \
     || $1 = "--help" \
     || $# > 2 ]]; then
    echo "usage:  "
    echo "  git-branch-root                        # find common root of current branch and `master` branch"
    echo "  git-branch-root <branch-other>         # find common root of current branch and <branch-other> "
    echo "  git-branch-root <branch-1> <branch-2>  # find common root of <branch-1> and <branch-2> "
  elif [[ "$#" == "0" ]]; then
    eval "git-branch-root  master  $(git-branch-current)"
  elif [[ "$#" == "1" ]]; then
    eval "git-branch-root  $1      $(git-branch-current)"
  else
    rootSpec=$(git merge-base $1 $2  |  cut -c -10)
    echo "  ${rootSpec} "
    echo "    |-- $1"
    echo "    |-- $2"
  fi
}

function git-branch-log() {   #TODO  fix this! needs `first` fn
  git log --oneline $(first $(git-branch-root))..$(git-branch-current)
}
alias git-log-string='git log -S'  # search log for changes to a string
# alias gitdg='git difftool --noprompt --extcmd="gvim -d --nofork -geometry 220x80+2000+40" '
# alias gitdg="git difftool --noprompt"
        # old version (doesn't work on mac):
        #   dg      = git difftool --no-prompt --extcmd='gvimdiff --nofork -geometry 180x50+20+40'
alias gitdg='git difftool --no-prompt --extcmd="gvim -d --nofork " '  # works on mac 2021

alias diffw="diff --ignore-all-space --ignore-blank-lines"

alias shx="chmod u+x *.sh *.bash *.csh *.zsh" # old:  *.clj  *.groovy
alias kk="kill -9"

alias zpr="java  -jar ~/opt/zprint.jar  -w **/*.clj "
alias zprv="java  -jar ~/opt/zprint.jar  --version  "

isMac    && alias pk="pkill -9 -i"
isLinux  && alias pk="pkill -9"

function pg() {
  ps -Fp $(pgrep ${1} )
}

alias blk="sleep 1 ; xset dpms force off"       # set screen to black (power off)
alias dosleep="systemctl suspend"

# Misc tools

# #todo make linux version
if $(isMac) ; then #{
  GDATE=gdate   # need `brew install coreutils`
fi #}

if $(isLinux) ; then #{
  GDATE=date

  # Return a timestamp string like "20161117-111307" (from  date --iso-8601=seconds => # "2016-11-17T11:13:07-08:00")
  alias dateTimeStr=" date --iso-8601=seconds | sed -e's/^\(.\{19\}\)\(.*\)/\1/' | sed -e's/-//g' | sed -e's/://g' | sed -e's/T/-/g' "

  function iso-date() {
    date "+%Y-%m-%d"
  }
  function iso-date-short() {
    date "+%Y%m%d"
  }
  function iso-time() {
    date "+%H:%M:%S"
  }
  function iso-time-short() {
    date "+%H%M%S"
  }
  function iso-date-time() {
    echo "$(iso-date)t$(iso-time)"
  }
  function iso-date-time-nice() {
    echo "$(iso-date) $(iso-time)"
  }
  function iso-date-time-str() {
    echo "$(iso-date-short)-$(iso-time-short)"
  }

fi #}

# string/char functions
function take-chars-6() {
  local inputStr=$1
  echo $inputStr | sed -e's/^\(......\).*/\1/'
}

# date/time functions
function iso-date() { $GDATE "+%Y-%m-%d" ; }
function iso-time() { $GDATE "+%H:%M:%S" ; }
function iso-date-time() { echo "$(iso-date)t$(iso-time)" ; }
function iso-date-time-nice() { echo "$(iso-date) $(iso-time)" ; }
function epoch-seconds() { $GDATE  "+%s" ; }
function timestamp-date() { $GDATE "+%Y%m%d" ; }
function timestamp-time() { $GDATE "+%H%M%S" ; }
function timestamp-micros() { take-chars-6 $($GDATE "+%N") ; }
function timestamp-date-time() { echo "$(timestamp-date)-$(timestamp-time)" ; }
function timestamp-date-time-micros() { echo "$(timestamp-date)-$(timestamp-time)-$(timestamp-micros)" ; }
function timestamp-epoch-seconds() { echo $(epoch-seconds) ; }
function timestamp-epoch-seconds-micros() { echo "$(timestamp-epoch-seconds)-$(timestamp-micros)" ; }

# Return a timestamp string like "20161117-111307" (from  date --iso-8601=seconds => # "2016-11-17T11:13:07-08:00")
alias dateTimeStr=" $GDATE --iso-8601=seconds | sed -e's/^\(.\{19\}\)\(.*\)/\1/' | sed -e's/-//g' | sed -e's/://g' | sed -e's/T/-/g' "

# Alias for home Cannon scanner driver
alias scanner=scangearmp

# Alias for Postman app (local install)
alias postman=Postman

# Google Cloud tools
#
# Copy local files to Google Cloud Storage using gzip compression for all files
# matching *.{txt,xml,csv,tsv,psv,html,js}, and set permission to public-read.
alias gsutil-cpz="gsutil cp -z txt,xml,csv,tsv,psv,html,js -a public-read "

# lein abbreviations
function rmt  { invokeEcho rm -rf ./target ; } # semicolon is required in BASH for 1-liner fns!!! (not zsh)
function lr   { evalEcho "time (lein run)" ; }
function lcr  { evalEcho "time (lein do clean, run)" ; }
function lt   { evalEcho "time (lein test)" ; }
function lta  { evalEcho "time (lein test :all)" ; }
function ltr  { evalEcho 'time (lein test-refresh)' ; }  # line test refresh
function lct  { evalEcho 'time (lein do clean, test)' ; }  # line clean test
function lcta { evalEcho "time (lein do clean, test :all)" ; }
function lctr { evalEcho "time (lein do clean, test-refresh)" ; }

function lanc() {  # Lein ANCient
  echo ""
  echo ""-----------------------------------------------------------------------------
  echo "project.clj:"
  echo ""
  lein ancient check           :all
  echo ""
  echo ""-----------------------------------------------------------------------------
  echo "profiles.clj:"
  echo ""
  lein ancient check-profiles  :all
  echo ""-----------------------------------------------------------------------------
  echo ""
}


#---------------------------------------------------------------------------------------------------
# python abbreviations
# python env vars
export PYTHONDONTWRITEBYTECODE="enable"     # invaluable for avoiding stale cache errors
# python abbreviations
# alias python=python3
alias py=python
alias py2=python2
alias py3=python3
alias pyx="chmod a+x *.py "
alias pyt="pytest -v"
alias venv2='virtualenv -p /usr/bin/python2 venv'
alias venv3='virtualenv -p /usr/bin/python3 venv'
function venvon() {
  echo '    source venv/bin/activate'
            source venv/bin/activate
}
function venvoff() {
  echo '    deactivate'
            deactivate
}

#---------------------------------------------------------------------------------------------------
# misc stuff
alias crashrm="sudo rm /var/crash/*"       # remove Ubuntu crash files that create annoying warnings
function mkpath() {
  mkdir -p "$1"
}
function mkdirs() {
  mkdir -p "$1"
}
function mkParents() {
  tgtFile=$1
  # echo $tgtFile
  tgtDir=${tgtFile%/*}
  # echo $tgtDir
  mkpath ${tgtDir}
}
function touchPath() {
  tgtFile=$1
  mkParents ${tgtFile}
  touch ${tgtFile}
}
alias histg="history | grep"
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""
alias rs="reset"
alias wifitoggle="nmcli r wifi off ; sleep 1 ; nmcli r wifi on"     # toggle wifi off/on to re-init after sleep
        # maybe try this too:  sudo service network-manager restart
alias pingg="ping -c5 google.com"
alias ping4="ping -c4"
alias xo="xdg-open"

# what your computer thinks its ip address is
function iplocal() {
  ip route get 8.8.8.8 | awk '{print $7; exit}'    # 8.8.8.8 is google dns
}
# what the outside world thinks your ip address is
function ipexternal() {
  curl --silent http://checkip.amazonaws.com # or:  http://ipinfo.io/ip
}
function ipinfo() {
  echo "local    IP  =>  $(iplocal)"
  echo "external IP  =>  $(ipexternal)"
}

#-----------------------------------------------------------------------------
# Docker stuff
alias dk="  docker"
alias dkm=" docker-machine"
alias dkn=" docker network"
alias dksr="docker service"
  # "docker swarm"
  # "docker deploy"
  # "docker stack"
alias dkc=" docker-compose"
alias dkrm="        dk  rm -v"          # by default always remove volumes
alias dkcrm="       dkc rm -vf"         # by default always remove volumes
alias dkmrm="       dkm rm -f"          # by default always remove volumes
alias dkps='        dk ps'
alias dkpsa='       dk ps -a'
alias dklist='      dk ps -aq'
alias dkclear='     dk rm -v $(dklist) '
alias dk-kill-all=' dk kill $(dk ps -q) '
alias dkip="docker inspect --format='{{.NetworkSettings.Networks.user_default.IPAddress}}' "  # <container-name>
                 # or --format='{{json .NetworkSettings.Networks.user_default.IPAddress}}'
alias docker-machine-disable=' DOCKER_MACHINE_IP="" ; DOCKER_TLS_VERIFY="" ; DOCKER_HOST="" ; DOCKER_CERT_PATH="" ; DOCKER_MACHINE_NAME="" '

# maven trick for ODL (-nsu => "No Snapshot Updates" downloaded from nexus.opendaylight.org)
mvnInstallCmd='mvn clean install -Dcheckstyle.skip=true -DskipTests -nsu'
alias mvn-install="echo ${mvnInstallCmd}; ${mvnInstallCmd}";

alias cp-shared=" sudo bash -c 'mv /media/sf_shared/* /shared; chown -R alan:alan /shared ' "

# GCP stuff
# export gcp1=35.230.123.85

#-----------------------------------------------------------------------------
# workarounds
if $(isLinux) ; then #{
  alias node=nodejs
  alias yarn=yarnpkg
fi #}

# echo "common.bash - exit"

