name "dev"
description "Sets up a java development enviroment"
run_list "recipe[apt]", "recipe[java]", "recipe[grails]", "recipe[git]", "recipe[subversion]"
override_attributes "java" => { "jdk_version" => "6" }