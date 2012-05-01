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

#template "/home/vagrant/.bash_profile" do
#  source "bash_profile.erb"
#  owner "vagrant"
#  group "vagrant"
#  action :create
#end

#directory "/home/vagrant/tools/grails-sh" do
#  owner "vagrant"
#  group "vagrant"
#  mode "0755"
#  action :create
#  recursive true
#end

#git "/home/vagrant/tools/grails-sh" do
#  repository "git://github.com/mattdelliott/grails.sh.git"
#  reference "HEAD"
#  user "vagrant"
#  group "vagrant"
#  action :sync
#end


grailsVersion = "grails-2.0.3"
grailsZip = "#{grailsVersion}.zip"
grailsSourceUrl = "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/#{grailsZip}"
grailsInstallDir = "/usr/local/grails"

remote_file "/usr/bin/grailsx" do 
  source "https://raw.github.com/mattdelliott/grails.sh/master/grails"
  owner "vagrant"
  group "vagrant"
  mode "0755"
  not_if {File.exists?("/usr/bin/grailsx")}
end

directory "#{grailsInstallDir}" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end

remote_file "/tmp/#{grailsZip}" do
 source "#{grailsSourceUrl}"
 mode "0644"
 not_if {File.exists?("/tmp/#{grailsZip}")}
end

execute "unzip" do
 user "vagrant"
 group "vagrant"

 cwd "#{grailsInstallDir}"
 command "unzip -d #{grailsInstallDir} /tmp/#{grailsZip}"
 creates "#{grailsInstallDir}/#{grailsVersion}"
 action :run
end

cookbook_file '/etc/profile.d/grails.sh' do
  owner "root"
  group "root"
  mode 0644
  source "etc/profile.d/grails.sh"
end