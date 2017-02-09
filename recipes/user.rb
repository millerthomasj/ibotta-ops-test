#
# Cookbook Name:: ibotta-ops-test
# Recipe:: user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

user node['ibotta']['ops']['user'] do
  manage_home true
end
