#
# Cookbook Name:: ibotta-ops
# Attributes:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

default['ibotta']['ops']['name'] = 'ibotta-ops-test'
default['ibotta']['ops']['git_repository'] = 'https://github.com/Ibotta/ops-dev-test.git'
default['ibotta']['ops']['git_revision'] = 'master'

default['ibotta']['ops']['dir'] = "/usr/share/#{node['ibotta']['ops']['name']}"
