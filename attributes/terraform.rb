include_attribute 'terraform'

default['terraform']['version'] = '0.7.1'
default['terraform']['zipfile'] = "terraform_#{node['terraform']['version']}_" \
  "#{node['os']}_#{node['terraform']['arch']}.zip"
