name "application"
description ""
run_list "recipe[application]"
#env_run_lists "prod" => [], "staging" => []
#default_attributes "apache2" => { "listen_ports" => [ "80", "443" ] }
#override_attributes "apache2" => { "max_children" => "50" }
