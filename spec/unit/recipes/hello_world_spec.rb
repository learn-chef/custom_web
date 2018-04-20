#
# Cookbook Name:: custom_web
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
require 'spec_helper'

describe 'hello_world_test::default' do
  platforms = {
      'centos' => '7.3.1611',
      'ubuntu' => '16.04',
  }

  platforms.each do |platform, version|
    context "when run on #{platform} #{version}" do
      let(:chef_run) do
        runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
        runner.converge(described_recipe)
      end

      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end

      it 'creates the default web site' do
        expect(chef_run).to create_custom_web_site 'default'
      end
    end
  end
end



describe 'hello_world_test::uninstall' do
  platforms = {
      'centos' => '7.3.1611',
      'ubuntu' => '16.04',
  }

  platforms.each do |platform, version|
    context "when run on #{platform} #{version}" do
      let(:chef_run) do
        runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
        runner.converge(described_recipe)
      end

      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end

      it 'deletes the default web site' do
        expect(chef_run).to delete_custom_web_site 'default'
      end
    end
  end
end
