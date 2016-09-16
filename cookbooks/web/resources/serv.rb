actions :install, :start, :stop, :restart, :setup, :reload

default_action :install

attribute :name, :kind_of => String, :name_attribute => true
