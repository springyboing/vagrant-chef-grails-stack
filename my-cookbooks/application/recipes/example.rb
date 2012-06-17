#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"
include_recipe "database"

directory "/vagrant/apps" do
  recursive true
end

git "ExampleApp" do
  repository "https://github.com/springyboing/GrailsExampleApp.git"
  reference "master"
  destination "/vagrant/apps/example-app"
  action :sync
end

git "ExampleAppDependency" do
  repository "https://github.com/springyboing/GrailsExampleAppDependency.git"
  reference "master"
  destination "/vagrant/apps/example-app-dependency"
  action :sync
end

# http://community.opscode.com/cookbooks/database

mysql_database 'example_app' do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

# externalize conection info in a ruby hash
mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}

# grant select,update,insert privileges to all tables in foo db from all hosts
mysql_database_user 'example_app_user' do
 connection mysql_connection_info
 password 'super_secret'
 database_name 'example_app'
 host '%'
 privileges [:select,:update,:insert]
 action :grant
end