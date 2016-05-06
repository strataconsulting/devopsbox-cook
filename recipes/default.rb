#
# Cookbook Name:: devopsbox
# Recipe:: default
#
# Copyright (c) 2016 Strata Consulting, Inc., All Rights Reserved.

# install os devtools
include_recipe 'build-essential'

# install useful rpms
%w(
  bash-completion
  mc
  mlocate
  git
  wget
  zip
  unzip
).each do |pkg|
  package pkg
end

include_recipe 'devopsbox::aws'
include_recipe 'devopsbox::chef-dk'
include_recipe 'devopsbox::hub'
include_recipe 'devopsbox::docker'
include_recipe 'devopsbox::bash'
include_recipe 'devopsbox::terraform'
include_recipe 'tmux'
