template '/etc/sysconfig/jenkins' do
  source 'jenkins_conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables ({
    :jenkins_port => node['jenkins']['port']
  })
end

cookbook_file '/var/lib/jenkins/config.xml' do
  source 'config.xml'
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  notifies :restart, 'service[jenkins]'
end

cookbook_file '/var/lib/jenkins/hudson.tasks.Maven.xml' do
  source 'hudson.tasks.Maven.xml'
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  notifies :restart, 'service[jenkins]'
end

remote_directory 'var/lib/jenkins/jobs' do
  source 'jobs'
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  notifies :restart, 'service[jenkins]'
end

service 'jenkins' do
  supports :start => true, :stop => true, :restart => true
  action [ :enable, :start ]
end
