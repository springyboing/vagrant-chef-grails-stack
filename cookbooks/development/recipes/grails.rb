#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


['unzip'].each do |pkg|
    package pkg do
        :upgrade
    end
end

directory "/home/vagrant/tools" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

git "/home/vagrant/tools/grails.sh" do
  repository "git://github.com/mattdelliott/grails.sh.git"
  reference "HEAD"
  user "vagrant"
  group "vagrant"
  action :sync
end

directory "/opt/grails" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end


grailsVersion = "grails-2.0.3"
grailsZip = "#{grailsVersion}.zip"

remote_file "/tmp/#{grailsZip}" do
 source "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/#{grailsZip}"
 mode "0644"
end

execute "unzip" do
 user "vagrant"
 group "vagrant"

 installation_dir = "/opt/grails"
 cwd installation_dir
 command "unzip -d #{installation_dir} /tmp/#{grailsZip}"
 creates installation_dir + "/grails/#{grailsVersion}"
 action :run
end
