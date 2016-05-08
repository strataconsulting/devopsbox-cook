module Devopsbox
  module Helpers
    # direnv packaging deconstruction
    #  - url: https://github.com/direnv/direnv/archive/v2.8.1.tar.gz
    #  - downloads to: direnv-2.8.1.tar.gz
    #  - extracts to: direnv-2.8.1
    def direnv_url
      "#{node['direnv']['base_url']}/v#{node['direnv']['version']}.tar.gz"
    end 

    def direnv_archive
      "direnv-#{node['direnv']['version']}.tar.gz"
    end 

    def direnv_file
      File.basename(direnv_archive, '.tar.gz')
    end
  end
end

::Chef::Node.send(:include, Devopsbox::Helpers)
::Chef::Recipe.send(:include, Devopsbox::Helpers)
::Chef::Provider.send(:include, Devopsbox::Helpers)
::Chef::Resource.send(:include, Devopsbox::Helpers)
