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

  path_prepend /opt/podman/bin
  path_prepend /opt/homebrew/bin

  path_append /usr/local/sbin
  path_append /usr/sbin
  path_append /sbin

  path_append ${HOME}/datomic

  path_append ${HOME}/.rd/bin
  
  #############################################################################
  ### Walmart - begin
  export SLEDGE_BIN=/Users/vn582dt/.sledge/bin
  path_append ${SLEDGE_BIN}
  ### Walmart - end
  #############################################################################

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
  export S8b="/Volumes/S8b"
  export E1="/Volumes/E1"
  export E2="/Volumes/E2"

  #-----------------------------------------------------------------------------
  alias df='df -g'
  alias du='du -g'

  # bitbucket auth tool (conflicts with babashka 'bb' command so can't symlink)
  alias bbkt="/opt/homebrew/Cellar/bb/0.6.0/bin/bb"     

  #-----------------------------------------------------------------------------
  # Walmart config
  export AKEYLESS_GATEWAY_URL="https://akeyless.gw.prod.glb.us.walmart.net:8080"
  export AKEYLESS_GATEWAY_CONFIG_URL="https://akeyless.gw.prod.glb.us.walmart.net:8000"
  # export KAFKA_BROKER_MAPPINGS='kafka.kafka-v2-conflux-ca-stg.cacentral.prod.ca.walmart.net:9093,127.0.0.1:9093;kafka.kafka-v2-conflux-ca-stg.caeast.prod.ca.walmart.net:9093,127.0.0.1:9094;kafka.kafka-v2-conflux-mx-stg.wus2.westus2.prod.us.walmart.net:9093,127.0.0.1:9096;kafka.kafka-v2-conflux-mx-stg.scus.prod.us.walmart.net:9093,127.0.0.1:9095'
  
  export http_proxy=http://sysproxy.wal-mart.com:8080
  export https_proxy=http://sysproxy.wal-mart.com:8080
  export no_proxy="localhost,.walmart.net,.prod.walmart.com,.qa.walmart.com,.cloud.walmart.com,.homeoffice.wal-mart.com,.cld.samsclub.com,.walmartlabs.com,.wmt,.local,.bfd.walmart.com,.gecwalmart.com,.prd.hosting.asda.com,.cert.hosting.asda.com,.sit.hosting.asda.com,.prod.jet.com,.qa.jet.com"
  alias unsetProxy="unset  http_proxy https_proxy no_proxy"

  APQ=$PWD/conflux-apq-distributor-shuttle
  LSV=$PWD/linksave-shuttle

fi #}

