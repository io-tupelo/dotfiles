if $(isLinux) ; then #{
  # echo "Found Linux"
  echo "Bash is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part

  lsColorFlag="--color" 

#---------------------------------------------------------------------------------------------------
  function graalvm() {
    export JAVA_HOME=/opt/graalvm
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  function java11() {
    export JAVA_HOME=/opt/java11
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  } 
  function java17() {
    export JAVA_HOME=/opt/java17
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  } 
  function java20() {
    export JAVA_HOME=/opt/java20
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }


  java20  >& /dev/null  # ********** default java version to use **********

fi #} if $(isLinux)
