if $(isLinux) ; then #{
  # echo "Found Linux"
  echo "Bash is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part

  lsColorFlag="--color" 

#---------------------------------------------------------------------------------------------------
  export JAVA_HOME="/opt/java"                                ; path_prepend ${JAVA_HOME}/bin
  export IDEA_HOME="/opt/idea"                                ; path_prepend ${IDEA_HOME}/bin
# export PGDATA="/var/edb/postgresql"
# export EDB_HOME="/opt/PostgreSQL/10"                        ; path_prepend ${EDB_HOME}/bin
# export YOURKIT_HOME="/opt/YourKit-JavaProfiler-2019.1"      ; path_prepend ${YOURKIT_HOME}/bin
# export DATOMIC_HOME="/opt/datomic"                          ; path_prepend ${DATOMIC_HOME}/bin
# export MAVEN_HOME="/opt/apache-maven"                       ; path_prepend ${MAVEN_HOME}/bin
# export PYTHON_PREFIX="${HOME}/.local/bin"                   ; path_prepend ${PYTHON_PREFIX}
# export POSTMAN_HOME="/opt/Postman"                          ; path_prepend ${POSTMAN_HOME}

  # extra cassandra stuff
  # export CQLSH_HOST=localhost  # without this cqlsh tries connecting to 172.17.42.1:9042 & crashes #todo
  # export CQLSH_PORT=9042

  # Maven stuff for ODL
  # export MAVEN_OPTS="-Xmx1048m"

  # path_prepend  /opt/solr/bin $path
    # ***** do not set SOLR_HOME *****
    # SOLR_HOME controls the location on disk of the conf & data dirs for a core,
    #   NOT the install location of the Solr binaries & libs

  function graalvm() {
    export JAVA_HOME=/opt/graalvm
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  function java8() {
    export JAVA_HOME=/opt/java8
    path_prepend "${JAVA_HOME}/bin"
    java  -version
  }
  function java11() {
    export JAVA_HOME=/opt/java11
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }

  function java15() {
    export JAVA_HOME=/opt/java15
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }

  function java17() {
    export JAVA_HOME=/opt/java17
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }

  java15  >& /dev/null  # ********** default java version to use **********

#---------------------------------------------------------------------------------------------------

#############################################################################
#TODO  need to make this not crash if no gvim installed!!!

  # unalias gvim >& /dev/null
  # alias gvim="${GVIM}  -geom '+4400+0' 2>/dev/null"
  # alias gvimw="${GVIM}  -geom '300x80+2200+0' "
  # if [[ $(hostname) == amy ]]; then
  #   # alias gvim="${GVIM}  -geom '+3300+0' 2>&/dev/null"
  #   unalias gvim
  # fi
#############################################################################

  alias idea="idea.sh &"
  alias yourkit="${YOURKIT_HOME}/bin/profiler.sh &"

  alias neo4j-start="/opt/neo4j/neo4j-desktop-1.4.8-x86_64.AppImage &"

fi #} if $(isLinux)
