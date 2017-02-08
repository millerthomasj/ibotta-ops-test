#
# Cookbook Name:: ibotta-ops-test
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'application'
app_name = node['ibotta']['ops']['name']

#deploy 'Ibotta_Ops_Dev_Test' do
#  repo node['ibotta']['ops']['git_repository']
#  revision node['ibotta']['ops']['git_revision']
#  deploy_to node['ibotta']['ops']['dir']
#  action :deploy
#end

application node['ibotta']['ops']['dir'] do
  git node['ibotta']['ops']['git_repository']
  bundle_install do
    deployment true
  end
#  revision node['ibotta']['ops']['git_revision']
#  action :sync
end
