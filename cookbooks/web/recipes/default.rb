#
# Cookbook Name:: web
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node.role?("#{node['web_server_type']['httpd']}")  
  prov = 'web_web-apache'
elsif node.role?("#{node['web_server_type']['nginx']}")
  prov = 'web_web-nginx'
else
  execute 'bash' do
    command "echo 'Undefined role. There is nothing to do!'"
  end 
end

web_serv 'install server' do
  provider prov
  action [ :install, :setup, :start ]
end

