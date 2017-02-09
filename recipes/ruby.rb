#
# Cookbook Name:: ibotta-ops-test
# Recipe:: ruby
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'build-essential'

ruby_runtime 'ibotta-ops-test' do
  provider :ruby_build
  version node['ibotta']['ruby']['version']
end

gem_package 'bundler'
gem_package 'sinatra'

include_recipe 'passenger_apache2'
