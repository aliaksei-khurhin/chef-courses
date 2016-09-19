#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# installing jenkins using 3 recipes
include_recipe 'jenkins::install'
include_recipe 'jenkins::plugins'
include_recipe 'jenkins::configure'
