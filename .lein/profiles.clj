{
  :user {
    :plugins [
      [com.jakemccrary/lein-test-refresh "0.24.1"]
     ;[jonase/eastwood          "0.4.3"]
      [lein-ancient             "0.7.0"]
      [lein-codox               "0.10.7"]
      [lein-exec                "0.3.7"]]
    :jvm-opts ["-Xms1g" "-Xmx4g" 
;              "-server"
;  "--add-opens" "java.base/java.lang=ALL-UNNAMED" ; make codox work on java 16+
              ] 
  } 
}
