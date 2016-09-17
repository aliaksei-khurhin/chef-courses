# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define 'chef-server' do |machine|
    machine.vm.box = 'ubuntu/trusty64'
    machine.vm.hostname = 'chef-server'
    machine.vm.network :private_network, ip: '192.168.33.10'
    machine.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = 4096
      vb.name = machine.vm.hostname
    end
    machine.vm.provision 'shell', inline: <<-SHELL
    sudo apt-get install vim -y
    cd /vagrant
    sudo dpkg -i chef-server-core_12.8.0-1_amd64.deb
    sudo chef-server-ctl reconfigure
    sudo chef-server-ctl install chef-manage
    sudo chef-server-ctl reconfigure
    sudo chef-manage-ctl reconfigure
    sudo chef-server-ctl user-create alexhurgin alex hurgin aliaksei_khurhin@epam.com 'p@$$w0rd' -f alexhurgin.pem
    sudo chef-server-ctl org-create test_org "test inc." --association_user alexhurgin -f test-validator.pem
    SHELL
  end

  config.vm.define 'chef-client1' do |machine|
    machine.vm.box = 'sbeliakou/centos-6.7-x86_64'
    machine.vm.hostname = 'chef-client1'
    machine.vm.network :private_network, ip: '192.168.33.15'
    machine.vm.provider "virtualbox" do |vb|
      vb.cpus = 1
      vb.memory = 512
      vb.name = machine.vm.hostname
    end
    machine.vm.provision 'shell', inline: <<-SHELL
    echo "192.168.33.10    chef-server" >> /etc/hosts
    rpm -i /vagrant/chef-12.14.60-1.el6.x86_64.rpm
    SHELL
  end

  config.vm.define 'chef-client2' do |machine|
    machine.vm.box = 'sbeliakou/centos-6.7-x86_64'
    machine.vm.hostname = 'chef-client2'
    machine.vm.network :private_network, ip: '192.168.33.20'
    machine.vm.provider "virtualbox" do |vb|
      vb.cpus = 1
      vb.memory = 512
      vb.name = machine.vm.hostname
    end
    machine.vm.provision 'shell', inline: <<-SHELL
    echo "192.168.33.10    chef-server" >> /etc/hosts
    rpm -i /vagrant/chef-12.14.60-1.el6.x86_64.rpm
    SHELL
  end

  config.vm.define 'chef-workstation' do |machine|
    machine.vm.box = 'sbeliakou/centos-6.7-x86_64'
    machine.vm.hostname = 'chef-workstation'
    machine.vm.network :private_network, ip: '192.168.33.25'
    machine.vm.provider "virtualbox" do |vb|
      vb.cpus = 1
      vb.memory = 512
      vb.name = machine.vm.hostname
    end
    machine.vm.provision 'shell', inline: <<-SHELL
    echo "192.168.33.10    chef-server" >> /etc/hosts
    yum install -y vim
    rpm -i /vagrant/*.rpm
    SHELL
  end
end