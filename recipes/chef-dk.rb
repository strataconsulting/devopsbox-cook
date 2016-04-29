#
# Cookbook Name:: devopsbox
# Recipe:: chef-dk
#
# Copyright (c) 2016 Strata Consulting, Inc., All Rights Reserved.

include_recipe 'chef-dk::default'

# chef plugins
plugins = %w(
  dotenv
  hipchat
  kitchen-docker
  kitchen-ec2
  kitchen-inspec
  knife-xapi
  thor-scmversion
)

plugins.each do |gem|
  gem_package gem do
    gem_binary "/opt/chefdk/embedded/bin/gem"
    options "--no-user-install"
    action :upgrade
  end
end

template '/etc/profile.d/chef-dk.sh' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end
