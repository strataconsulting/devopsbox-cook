#
# Cookbook Name:: devopsbox
# Recipe:: docker
#
# Copyright (c) 2016 Strata Consulting, Inc., All Rights Reserved.

docker_service 'default' do
  #tls false
  #provider Chef::Provider::DockerService::Sysvinit
  action [:create, :start]
  group 'wheel'
end
