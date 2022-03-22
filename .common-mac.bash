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

  path_append /usr/local/sbin
  path_append /usr/sbin
  path_append /sbin

  path_append ${HOME}/datomic

  alias dotags="ctags -R -f .tags"

  ### alias d='    ls -ldF'
  ### alias lal='  ls -alF'
  alias idea='echo "not implemented; start IDEA from dock" '

  function graalvm() {
    export JAVA_HOME=/opt/graalvm/Contents/Home
    export GRAALVM_HOME=${GRAALVM_HOME}  # not needed for Java/Clojure (just llvm/polyglot stuff)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  function openjdk8() {
    export JAVA_HOME="/usr/local/Cellar/openjdk@8/1.8.0+312"
    path_prepend ${JAVA_HOME}/bin
    java -version
  }
  function openjdk11() {
    export JAVA_HOME="/usr/local/Cellar/openjdk@11/11.0.12"
    path_prepend ${JAVA_HOME}/bin
    java -version
  }
  function openjdk17() {
    export JAVA_HOME="/usr/local/Cellar/openjdk/17.0.2"
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  # aliases since no Oracle Java 8 or 11 
  function java8() { openjdk8 ; }
  function java11() { openjdk11 ; }

  # function java8() {
  #   export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
  #   path_prepend ${JAVA_HOME}/bin
  #   java -version
  # }
  # function java11() {
  #   export JAVA_HOME=$(/usr/libexec/java_home -v 11)
  #   path_prepend ${JAVA_HOME}/bin
  #   java -version
  # }
  function java17() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 17)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  java8 >& /dev/null

  # alias gvim="/usr/local/bin/gvim"
  # alias vim="/usr/local/bin/xvim"

fi #}

