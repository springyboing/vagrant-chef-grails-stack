name "database"
description "Database server"
run_list "recipe[apt]", "recipe[mysql::server]"
#env_run_lists "prod" => [], "staging" => []
#default_attributes "apache2" => { "listen_ports" => [ "80", "443" ] }
override_attributes "mysql" => { "server_root_password" => "password" }