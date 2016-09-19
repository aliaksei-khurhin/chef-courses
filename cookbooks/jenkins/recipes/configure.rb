# generates jenkins config from template
template '/etc/sysconfig/jenkins' do
  source 'jenkins_conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables ({
    :jenkins_port => node['jenkins']['port']
  })
end

# hash with filenames and paths
files = { 'config.xml' => '/var/lib/jenkins/config.xml', 'hudson.tasks.Maven.xml' => '/var/lib/jenkins/hudson.tasks.Maven.xml' }

# copyinf jenkins server.xml and maven config
files.each do | file, path |
  cookbook_file path do
    source file
    owner 'jenkins'
    group 'jenkins'
    mode '0755'
    notifies :restart, 'service[jenkins]'
  end
end

# copying jenkins jobs
remote_directory 'var/lib/jenkins/jobs' do
  source 'jobs'
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  notifies :restart, 'service[jenkins]'
end

# jenkins service description and start
service 'jenkins' do
  supports :start => true, :stop => true, :restart => true
  action [ :enable, :start ]
end
