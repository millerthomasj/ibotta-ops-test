#
# Cookbook Name:: ibotta-ops-test
# Recipe:: mysql
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

mysql_client 'default' do
  action :create
end

directory '/data' do
  owner node['ibotta']['ops']['user']
  action :create
end

mysql_service 'ibotta-ops' do
  version '5.7'
  port '3306'
  run_user node['ibotta']['ops']['user']
  data_dir '/data'
  initial_root_password 'changeMe'
  action [:create, :start]
end

gem_package 'mysql2'

mysql_database_user node['ibotta']['mysql']['user'] do
  connection(
    :host => '127.0.0.1',
    :username => 'root',
    :password => 'changeMe'
  )
  privileges [:all]
  action [:create, :grant]
end
