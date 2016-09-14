# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "chef-master" do |chef|
    chef.vm.box = "sbeliakou/centos-6.7-x86_64"
    chef.vm.hostname = "chef-master"
    chef.vm.network :private_network, ip: "192.168.33.10"
    chef.vm.network :forwarded_port, guest: 8080, host: 8080
    chef.vm.provider "virtualbox" do |vb|
      vb.name = chef.vm.hostname
      vb.cpus = 2
      vb.memory = 2048
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum install -y vim git
  SHELL
end

 

