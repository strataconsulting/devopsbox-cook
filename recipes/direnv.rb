#
# Cookbook Name:: devopsbox
# Recipe:: direnv
#
# Copyright (c) 2016 Strata Consulting, Inc., All Rights Reserved.

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
