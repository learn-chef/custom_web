#
# Cookbook Name:: hello_world_test
# Recipe:: uninstall
#
# Copyright (c) 2018 The Authors, All Rights Reserved.


custom_web_site 'default' do
  action :delete
end
