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

bash "git-aliases" do
    user node[:user]
    group node[:user]
    code <<-FIN
        git config --global alias.co checkout
        git config --global alias.br branch
        git config --global alias.ci commit
        git config --global alias.st status
    FIN
end
