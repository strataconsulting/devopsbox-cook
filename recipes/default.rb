#
# Cookbook Name:: devopsbox
# Recipe:: default
#
# Copyright (c) 2016 Strata Consulting, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# install os devtools
if node['platform_family'] == 'rhel'
  include_recipe 'yum-epel'
else
  include_recipe 'apt'
end
include_recipe 'build-essential'

# install useful rpms
%w(
  bash-completion
  git
  mc
  mlocate
  ncdu
  unzip
  wget
  zip
).each do |pkg|
  package pkg
end
# https://github.com/chef-cookbooks/yum/issues/148
if node['platform'] == 'redhat'
  execute 'enable rhui-REGION-rhel-server-optional repo' do
    command 'yum-config-manager --enable rhui-REGION-rhel-server-optional'
    user 'root'
    not_if 'yum repolist|grep -c rhui-REGION-rhel-server-optional', user: 'root'
  end
end

include_recipe 'tmux'
include_recipe 'devopsbox::aws'
include_recipe 'devopsbox::chef-dk'
include_recipe 'devopsbox::hub'
include_recipe 'devopsbox::docker'
include_recipe 'devopsbox::bash'
include_recipe 'devopsbox::terraform'
include_recipe 'devopsbox::direnv'
include_recipe 'devopsbox::packer'
