#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package "git"
package "build-essential"

directory node[:personal_bin] do
    owner node[:user]
    group node[:user]
end
