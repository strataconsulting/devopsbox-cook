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
  ncdu
).each do |pkg|
  package pkg
end

include_recipe 'tmux'
include_recipe 'devopsbox::aws'
include_recipe 'devopsbox::chef-dk'
include_recipe 'devopsbox::hub'
include_recipe 'devopsbox::docker'
include_recipe 'devopsbox::bash'
include_recipe 'devopsbox::terraform'
include_recipe 'devopsbox::direnv'
