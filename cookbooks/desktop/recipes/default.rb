#
# Cookbook Name:: desktop
# Recipe:: default
[
    {
        "ubuntu" => "build-essential",
        "arch" => "group:base-devel",
    },
    "sudo",
].each do |to_install|
    multipack to_install
end

user node[:user] do
    comment node[:name]
    group node[:user]
    home node[:home]
    manage_home true
    shell node[:shell]
end

group "wheel" do
    members node[:user]
    action :modify
    append true
end

sudo "privileged-wheel" do
    user "%wheel"
    runas "ALL"
    commands ["ALL"]
end

directory File.join node[:home], ".config" do
    owner node[:user]
    group node[:user]
end

directory node[:personal_bin] do
    owner node[:user]
    group node[:user]
end

directory node[:cde] do
    owner node[:user]
    group node[:user]
end

############################
# Platform specific things #
############################
case node[:platform]
when "ubuntu"
    # Add all the ppas
    node[:ppas].each do |ppa|
        apt_repository ppa[4..-1].gsub(/\//, "-") do
          uri ppa
          distribution node["lsb"]["codename"]
        end
    end

    # Update the apt cache
    apt_update "simple" do
        action :periodic
    end
when "arch"
    include_recipe "pacman::default"
end
