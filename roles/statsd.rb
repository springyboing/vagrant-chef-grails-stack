name "dev"
description "Sets up statsd enviroment"
run_list "recipe[apt]", "recipe[statsd]"