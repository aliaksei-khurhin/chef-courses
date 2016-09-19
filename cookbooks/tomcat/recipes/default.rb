#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# setting packages to install
packages = [ 'java-1.7.0-openjdk-devel.x86_64', 'tomcat' ]

# installing packages
packages.each do |pack|
  package pack
end

# starting tomcat
service 'tomcat' do
  supports :restart => true, :stop => true
  action [ :enable, :start ]
end
