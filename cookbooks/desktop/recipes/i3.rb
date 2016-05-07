# Cookbook Name:: desktop
# Recipe:: i3
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Configure i3 wm
template node[:i3][:config_path] do
    source "i3/config.erb"
end

# Configure i3-status
template node[:i3][:status_config_path] do
    source "i3/status/config.erb"
end
