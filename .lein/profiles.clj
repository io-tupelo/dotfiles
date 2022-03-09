{
  :user {
    :plugins [
      [com.jakemccrary/lein-test-refresh "0.25.0"]
     ;[jonase/eastwood          "0.4.3"]
      [lein-ancient             "0.7.0"]
      [lein-exec                "0.3.7"]]
    :jvm-opts ["-Xms1g" "-Xmx4g" 
;              "-server"
;  "--add-opens" "java.base/java.lang=ALL-UNNAMED" ; make codox work on java 16+
              ] 
  } 
}
