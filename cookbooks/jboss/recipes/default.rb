#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright (c) 2016 Alex Hurgin, All Rights Reserved.

node.override['java']['install_flavor'] = "oracle"
node.override['java']['jdk_version'] = "6"
node.override['java']['oracle']['accept_oracle_download_terms'] = true

include_recipe 'java'
#include_recipe 'zipfile'

package 'install unzip' do
  package_name 'unzip'
end

user 'jboss' do
  comment 'JBoss AS user'
  home '/opt/jboss/jboss-5.1.0.GA'
  shell '/bin/bash'
  password '$1$azraIzD6$lWJBh4oUf1t0STyJQYzYN.'
end

directory '/opt/jboss' do
  owner 'jboss'
  group 'jboss'
  mode '0755'
  recursive true
  not_if {File.directory?( '/opt/jboss')}
end

remote_file '/opt/jboss/jboss-5.1.0.GA.zip' do
  source 'http://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip'
  owner 'jboss'
  group 'jboss'
  mode '0755'
  not_if {::File.exists?('/opt/jboss/jboss-5.1.0.GA.zip')}
end

execute 'unpack jboss' do
  cwd '/opt/jboss'
  command 'unzip /opt/jboss/jboss-5.1.0.GA.zip'
#  command 'rm -f *.zip'
  not_if { File.directory?('/opt/jboss/jboss-5.1.0.GA') }
end

remote_file "/tmp/testweb.zip" do
  source "#{node['jboss']['app_url']}"
  not_if { ::File.exists?("/tmp/testweb.zip")}
end

execute 'unpack testapp' do
  cwd '/tmp'
  command 'unzip /tmp/testweb.zip -d /opt/jboss/jboss-5.1.0.GA/server/default/deploy'
#  command 'rm -f *.zip'
  not_if { File.directory?('/opt/jboss/jboss-5.1.0.GA/server/default/deploy/hudson') }
end

template '/etc/init.d/jboss' do
  source 'jboss_init.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables ({
     :jboss_user => 'jboss',
     :jboss_home => '/opt/jboss/jboss-5.1.0.GA',
     :jboss_ip => '192.168.33.10'
  })
  not_if { File.exist?('/etc/init.d/jboss' )}
end

template '/opt/jboss/jboss-5.1.0.GA/server/default/deploy/hudson/hudson.xml' do
  source 'hudson.erb'
  owner 'jboss'
  group 'jboss'
  variables ({
     'engine' => data_bag_item('test', 'test.json')['engine']
  })
  action :create
end

execute 'chown' do
  cwd '/opt/jboss'
  command 'chown -R jboss:jboss jboss-5.1.0.GA'
end

execute '+x script files' do
  cwd '/opt/jboss/jboss-5.1.0.GA/bin'
  command 'chmod a+x *.sh'
end

service 'jboss' do
  init_command '/etc/init.d/jboss'
  service_name 'jboss'
  supports :restart => true, :stop => true
  action [ :enable, :start]
  subscribes :restart, 'template[/etc/init.d/jboss]', :immediate
end
