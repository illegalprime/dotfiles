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
    action :create
end

group 'add_user_to_wheel' do
    group_name 'wheel'
    members node[:user]
    action :modify
    append true
end

sudo "privileged-wheel" do
    user "%wheel"
    runas "ALL"
    commands ["ALL"]
end

directory 'create ~/.config' do
    path node[:config]
    owner node[:user]
    group node[:user]
    mode 0755
end

directory 'create ~/.bin' do
    path node[:personal_bin]
    owner node[:user]
    group node[:user]
    mode 0755
end

directory 'create ~/cde' do
    path node[:cde]
    owner node[:user]
    group node[:user]
    mode 0755
end

directory node[:xresources_dir] do
    owner node[:user]
    group node[:user]
    mode 0755
end

# Install all wanted fonts
node[:avail_fonts].values.each do |font|
    multipack font[:package]
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

    # recipes can notify this block to update the cache
    apt_update "apt-update-now" do
        action :nothing
    end
when "arch"
    include_recipe "pacman::default"
end
