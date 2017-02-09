#
# Cookbook Name:: ibotta-ops
# Attributes:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

default['ibotta']['ops']['name'] = 'ibotta-ops-test'
default['ibotta']['ops']['user'] = 'deploy'
default['ibotta']['ops']['git_repository'] = 'https://github.com/Ibotta/ops-dev-test.git'
default['ibotta']['ops']['git_revision'] = 'master'
default['ibotta']['ops']['rack_env'] = 'production'

default['ibotta']['ops']['dir'] = "/var/www/#{node['ibotta']['ops']['name']}"
default['ibotta']['ruby']['version'] = '2.3.1'

default['ibotta']['mysql']['user'] = 'ibotta'

default['apache']['listen'] = [ "*:4567" ]
