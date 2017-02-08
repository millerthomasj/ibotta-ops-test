#
# Cookbook Name:: ibotta-ops-test
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'git::default'
app_name = node['ibotta']['ops']['name']

user 'deploy' do
  manage_home true
end

application app_name do
  owner 'deploy'
  group 'deploy'

  mysql_client 'default' do
    action :create
  end

  mysql_service 'default' do
    version '5.7'
    bind_address '0.0.0.0'
    port '3306'
    data_dir '/data'
    initial_root_password 'Ch4ng3me'
    action [:create, :start]
  end

  ruby_runtime app_name do
    provider :ruby_build
    version node['ibotta']['ruby']['version']
  end

  gem_package 'bundler'

  deploy_revision node['ibotta']['ops']['dir'] do
    repo node['ibotta']['ops']['git_repository']
    user 'deploy'
    revision node['ibotta']['ops']['git_revision']
    action :deploy
    migrate false
    symlink_before_migrate.clear
    create_dirs_before_symlink.clear
    purge_before_symlink.clear
    symlinks.clear
  end

  execute "sed -i '/^ruby.*$/d' #{node['ibotta']['ops']['dir']}/current/Gemfile"

  bundle_install "#{node['ibotta']['ops']['dir']}/current" do
    user 'deploy'
    deployment true
  end

  ruby_execute "app.rb >> /tmp/logfile 2>&1 &" do
    cwd "#{node['ibotta']['ops']['dir']}/current"
    user 'deploy'
  end
end
