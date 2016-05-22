#
# Cookbook Name:: gce_mysql_proxy
# Spec:: default
#
# Copyright (c) 2016 Liqwyd Ltd., All Rights Reserved.

require 'spec_helper'

describe 'gce_mysql_proxy::default' do
  before do
    stub_command('mount | grep /cloudsql >/dev/null')
  end

  context 'When all attributes are default, on a 64bit platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new do |node, _server|
        node.automatic['kernel']['processor'] = 'x86_64'
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on a 32bit platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new do |node, _server|
        node.automatic['kernel']['processor'] = 'i686'
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
