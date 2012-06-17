name "application"
description ""
run_list "recipe[gem_installer]", "recipe[application::example]"
# run_list "recipe[mysql::client]", "recipe[application::example]"
# override_attributes( :gem_installer => { :gems => { 'mysql' => nil } } )
override_attributes( :gem_installer => { :chef_gems => { 'mysql' => nil } } )