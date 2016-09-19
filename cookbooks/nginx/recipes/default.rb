#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# downloading nginx repository file 
remote_file '#{node['nginx']['tmp_folder']}/nginx_repo.rpm' do
  source 'http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm'
end

# installing nginx repository
rpm_package '#{node['nginx']['tmp_folder']}/nginx_repo.rpm' do
  action :install
end

# deleting temporary file
file '#{node['nginx']['tmp_folder']}/nginx_repo.rpm' do
  action :delete
end

# installing nginx using yum
package 'nginx'

# retrieving node IP-address
ip = node['network']['interfaces']['eth1']["addresses"].keys[1]

#generating nginx config from template
template '/etc/nginx/conf.d/virtual.conf' do
  source 'nginx_conf.erb'
  owner 'nginx'
  group 'nginx'
  variables ({
    :web_port => node['nginx']['port'],
    :jenkins_port => node['jenkins']['port'],
    :tomcat_port => node['tomcat']['port'],
    :ipaddress => ip
  })
  notifies :restart, 'service[nginx]'
end

# defining nginx service settings
service 'nginx' do
  supports :stop => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
