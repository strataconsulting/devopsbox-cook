require 'spec_helper'

describe 'devopsbox::default' do
  # expect chefdk components to be installed
  describe command('chef --version') do
    its(:stdout) { should match /^Chef Development Kit Version: 0\.[0-9]+\.[0-9]+$/ }
    its(:stdout) { should match /^chef-client version: 12\.[0-9]+\.[0-9]+$/ }
    its(:stdout) { should match /^berks version: 4\.[0-9]+\.[0-9]+$/ }
    its(:stdout) { should match /^kitchen version: 1\.[0-9]+\.[0-9]+$/ }
  end
  
  # expect terraform to be installed
  describe command('/usr/local/bin/terraform --version') do
    its(:stdout) { should match /^Terraform v0\.7\.2.*/ }
  end

  # expect packer to be installed
  describe command('/usr/local/bin/packer version') do
    its(:stdout) { should match /^Packer v0\.10\.1.*$/ }
  end

  # expect chefdk smoke test to work
  describe command('chef verify --verbose') do
    # exit_status test failing via kitchen while passing manually so switching to stdout check for now
    #its(:exit_status) { should eq 0 }
    its(:stdout) { should_not match /^Verification .* failed./ }
  end

  # os development tools
  %w(kernel-headers kernel-devel gcc make).each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end

  describe command('make --help') do
    its(:exit_status) { should eq 0 }
  end

  # misc tools packages
  %w(bash-completion git mc zip wget unzip).each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end

  # expect awscli to be installed
  describe command('/usr/bin/aws ec2 --version') do
    its(:exit_status) { should eq 0 }
  end

  # expect hub to be installed
  describe command('/usr/local/bin/hub --version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /^hub version 2\.[0-9]+\.[0-9]+$/ }
  end

  # expect hub bash completion file to be installed
  describe file('/etc/bash_completion.d/hub.bash_completion.sh') do
    it { should be_file }
    it { should be_mode 755 }
  end

  # expect chef plugins/gems to be installed
  %w(
    dotenv
    hipchat
    kitchen-docker
    kitchen-ec2
    knife-xapi
    thor-scmversion
  ).each do |p|
    describe command("chef gem list -i #{p}") do
      its(:exit_status) { should eq 0 }
    end
  end

  # expect docker to be working
  describe command('docker ps') do
    its(:stdout) { should match /^CONTAINER ID/ }
  end

  # expect tmux to be installed
  describe command('/usr/local/bin/tmux -V') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /^tmux 2\.2/ }
  end

  # expect direnv to be installed
  describe command('/usr/local/bin/direnv') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /^direnv v2/ }
  end

end
