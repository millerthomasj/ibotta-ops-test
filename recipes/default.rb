#
# Cookbook Name:: ibotta-ops-test
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'git::default'
include_recipe 'ibotta-ops-test::packages'
include_recipe 'ibotta-ops-test::user'
include_recipe 'ibotta-ops-test::apache2'
include_recipe 'ibotta-ops-test::ruby'
include_recipe 'ibotta-ops-test::mysql'

app_name = node['ibotta']['ops']['name']

deploy_revision node['ibotta']['ops']['dir'] do
  repo node['ibotta']['ops']['git_repository']
  user node['ibotta']['ops']['user']
  revision node['ibotta']['ops']['git_revision']
  action :deploy
  migrate false
  symlink_before_migrate.clear
  create_dirs_before_symlink  %w{tmp public}
  symlinks.clear
end

execute "sed -i '/^ruby.*$/d' #{node['ibotta']['ops']['dir']}/current/Gemfile"

if node['ibotta']['ops']['rack_env'] == 'production'
  bundle_install "#{node['ibotta']['ops']['dir']}/current" do
    user node['ibotta']['ops']['user']
    deployment true
    without 'development test'
  end
else
  bundle_install "#{node['ibotta']['ops']['dir']}/current" do
    user node['ibotta']['ops']['user']
    deployment true
  end
end

cookbook_file "#{node['ibotta']['ops']['dir']}/current/config.ru" do
  source 'config.ru'
  owner node['ibotta']['ops']['user']
  group node['ibotta']['ops']['user']
  mode 0644
  action :create
end

web_app 'ibotta-ops' do
  server_name node['hostname']
  server_port '4567'
  server_aliases [node['fqdn'], "ibotta-ops-test"]
  docroot "#{node['ibotta']['ops']['dir']}/current/public"
  mysql_username node['ibotta']['mysql']['user']
end
