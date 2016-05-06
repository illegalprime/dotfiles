#
# Cookbook Name:: desktop
# Recipe:: i3
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template node[:i3][:config_path] do
    source "i3/config.erb"
end
