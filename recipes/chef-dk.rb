#
# Cookbook Name:: devopsbox
# Recipe:: chef-dk
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
