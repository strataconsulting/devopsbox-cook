#
# Cookbook Name:: devopsbox
# Recipe:: docker
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

if node['os_version'] !~ /^3\.2\.0.*$/
  docker_service 'default' do
    #tls false
    #provider Chef::Provider::DockerService::Sysvinit
    action [:create, :start]
    group 'root'
  end
end
