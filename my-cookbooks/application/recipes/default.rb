#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "subversion"
include_recipe "git"


directory "/vagrant/apps" do
  recursive true
end

subversion "SimpleSvnProject" do
  repository "http://svn.apache.org/repos/asf/couchdb/trunk"
  revision "HEAD"
  destination "/vagrant/apps/sample-svn"
  action :sync
end

git "/vagrant/sample-git" do
  repository "https://github.com/grails-samples/grailstwitter.git"
  reference "master"
  destination "/vagrant/apps/sample-git"
  action :sync
end