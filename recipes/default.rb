#
# Cookbook Name:: ibotta-ops-test
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'tmux'

template '/etc/tmux.conf' do
  source 'tmux.conf.erb'
  mode   '0644'
end
