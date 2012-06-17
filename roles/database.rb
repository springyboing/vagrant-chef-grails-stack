name "database"
description "Database server"
run_list "recipe[mysql::server]"
override_attributes "mysql" => { "server_root_password" => "password" }