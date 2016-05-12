#
# Cookbook Name:: desktop
# Recipe:: default
multipack({
    "ubuntu" => "build-essential",
    "arch" => "group:base-devel",
})

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
