#
# Cookbook Name:: devopsbox
# Recipe:: bash
#
# Copyright (c) 2016 Strata Consulting, Inc., All Rights Reserved.

# bash prompt
template '/etc/profile.d/bash_prompt.sh' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

# git-prompt.sh
template '/etc/profile.d/git-prompt.sh' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

# misc aliases
template '/etc/profile.d/aliases.sh' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end
