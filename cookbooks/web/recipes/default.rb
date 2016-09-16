#
# Cookbook Name:: web
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['web_server_type'] == "apache_web_server"
  prov = 'web_web-apache'
elsif node['web_server_type'] == "nginx_web_server"
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

