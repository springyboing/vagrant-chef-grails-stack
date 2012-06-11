name "dev"
description "Sets up a java development enviroment"
run_list "recipe[apt]", "recipe[grails]", "recipe[groovy]", "recipe[git]", "recipe[subversion]"
#env_run_lists "prod" => [], "staging" => []
#default_attributes "apache2" => { "listen_ports" => [ "80", "443" ] }
override_attributes "java" => { "jdk_version" => "7" }