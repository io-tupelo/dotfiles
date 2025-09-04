# Mac OSX config
if $(isMac) ; then #{

  # echo "Found Darwin"
  echo "OSX is dumb!"  > /dev/null  # stupid bash can't handle an empty "then" part
  # sleep 3

  # mac osx uses an old /bin/ls from BSD 2002 that cannot handle the GNU ls option '--color'
  lsColorFlag="-G" 
  export LSCOLORS=gxfxcxdxbxegedabagacad
  # default value exfxcxdxbxegedabagacad
  # change the default blue for directories to cyan (much easier to read on black terminal)
  # see 'man ls' on mac osx for full details

  #TODO maybe make aliases for homebrew coreutils (like ls => gls, etc)

  path_prepend /opt/homebrew/bin

  path_append /usr/local/sbin
  path_append /usr/sbin
  path_append /sbin

  path_append ${HOME}/datomic

  path_append ${HOME}/.rd/bin

  alias dotags="ctags -R -f .tags"

  alias idea='echo "not implemented; start IDEA from dock" '

# function graalvm() {
#   export JAVA_HOME=/opt/graalvm/Contents/Home
#   export GRAALVM_HOME=${GRAALVM_HOME}  # not needed for Java/Clojure (just llvm/polyglot stuff)
#   path_prepend ${JAVA_HOME}/bin
#   java -version
# }

# # below works for apple silicon version of Homebrew
# function openjdk11() {
#   export JAVA_HOME="/opt/homebrew/opt/openjdk@11" # symlink
#   path_prepend ${JAVA_HOME}/bin
#   java -version
# }
# function openjdk17() {
#   export JAVA_HOME="/opt/homebrew/opt/openjdk@17" # symlink
#   path_prepend ${JAVA_HOME}/bin
#   java -version
# }
# function openjdk21() {
#   export JAVA_HOME="/opt/homebrew/opt/openjdk@21" # symlink => /usr/local/Cellar/openjdk/21.0.1
#   path_prepend ${JAVA_HOME}/bin
#   java -version
# }
#
# # aliases since no Oracle Java 8 or 11 
# function java11() { openjdk11 ; }
#
# #---------------------------------------------------------------------------------------------------
# # Download Oracle JDK from:  https://www.oracle.com/java/technologies/downloads/#jdk20-mac
# #
# function java17() {
#   export JAVA_HOME=$(/usr/libexec/java_home -v 17)
#   path_prepend ${JAVA_HOME}/bin
#   java -version
# }
# function java21() {
#   export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
#   path_prepend ${JAVA_HOME}/bin
#   java -version
# }
#
# ***** vvv old way, clashes with openjdk21 vvv *****
# function java21() {
#   export JAVA_HOME=$(/usr/libexec/java_home -v 21)
#   path_prepend ${JAVA_HOME}/bin
#   java -version
# }
#
# java21 >& /dev/null       # default to newest version of java

  # alias gvim="/usr/local/bin/gvim"
  # alias vim="/usr/local/bin/xvim"

  # required for `lein deploy clojars` on OSX for tty input
  # export GPG_TTY=$(tty)

  #-----------------------------------------------------------------------------
  export S2="/Volumes/S2"
  export S4="/Volumes/S4"
  export S8a="/Volumes/S8a"
  export E1="/Volumes/E1"
  export E2="/Volumes/E2"

  alias df='df -g'
  alias du='du -g'


fi #}

