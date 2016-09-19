#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

remote_file '/tmp/nginx_repo.rpm' do
  source 'http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm'
end

rpm_package '/tmp/nginx_repo.rpm' do
  action :install
end

package 'nginx'

ip = node['ipaddress']

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
end

service 'nginx' do
  action [ :enable, :start ]
end
