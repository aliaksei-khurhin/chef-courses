# adding jenkins repository to the system
yum_repository "jenkins" do
  baseurl "http://pkg.jenkins-ci.org/redhat"
  gpgkey "https://jenkins-ci.org/redhat/jenkins-ci.org.key"
  action :create
end

# setting packages to install
pack = [ 'jenkins', 'git' ]

# installing packages using yum
pack.each do |install|
  package install
end

# altering jenkins user to access to tomcat deploy directory
user 'jenkins' do
  group 'tomcat'
end
