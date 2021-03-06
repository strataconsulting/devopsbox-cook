#
# Cookbook Name:: devopsbox
# Spec:: default
#
# Copyright (c) 2016 Strata Consulting, Inc.

require 'spec_helper'

describe 'devopsbox::direnv' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
