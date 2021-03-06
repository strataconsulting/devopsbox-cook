#
# Cookbook Name:: devopsbox
# Recipe:: hub
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

# TODO: support 'latest' download
HUB_SOURCE  = 'https://github.com/github/hub/releases/download'
HUB_VERSION = '2.2.3'
HUB_SHASUM = '54c35a459a4241b7ae4c28bcfea0ceef849dd2f8a9dd2b82ba2ba964a743e6bc'

ark 'hub' do
  url "#{HUB_SOURCE}/v#{HUB_VERSION}/hub-linux-amd64-#{HUB_VERSION}.tgz"
  checksum HUB_SHASUM
  version HUB_VERSION
  has_binaries ['bin/hub']
  append_env_path false
  strip_components 1
  action :install
end

remote_file '/etc/bash_completion.d/hub.bash_completion.sh' do
  source "file:///usr/local/hub/etc/hub.bash_completion.sh"
  mode 00755
  action :create
end

template '/etc/profile.d/hub.sh' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end
