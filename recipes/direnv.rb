#
# Cookbook Name:: devopsbox
# Recipe:: direnv
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

include_recipe 'golang'

remote_file "#{Chef::Config['file_cache_path']}/#{direnv_archive}" do
  source direnv_url
  checksum node['direnv']['checksum']
  notifies :run, 'bash[install_direnv]', :immediately
end

bash 'install_direnv' do
  user 'root'
  cwd Chef::Config['file_cache_path']
  # root doesn't get gopath here by default because it's not login shell
  environment 'PATH' => "#{node['go']['install_dir']}/go/bin:#{ENV['PATH']}"
  code <<-EOH
      tar -xvzf #{direnv_archive}
      cd #{direnv_file}
      make install
    EOH
  action :nothing
end
