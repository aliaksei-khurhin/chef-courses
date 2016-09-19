yum_repository "jenkins" do
  baseurl "http://pkg.jenkins-ci.org/redhat"
  gpgkey "https://jenkins-ci.org/redhat/jenkins-ci.org.key"
  action :create
end

pack = [ 'jenkins', 'git' ]

pack.each do |install|
  package install
end

user 'jenkins' do
  group 'tomcat'
end

directory '/var/lib/jenkins/plugins' do
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  action :create
end
