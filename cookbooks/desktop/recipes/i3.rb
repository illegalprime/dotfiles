# Cookbook Name:: desktop
# Recipe:: i3
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory node[:i3][:config_dir] do
    user node[:user]
    group node[:user]
end

# Configure i3 wm
template node[:i3][:config_path] do
    user node[:user]
    group node[:user]
    source "i3/config.erb"
end

# Configure i3-status
template node[:i3][:status_config_path] do
    user node[:user]
    group node[:user]
    source "i3/status/config.erb"
end

# Install i3 extra utils
# For nm-applet
multipack({
    "ubuntu" => "network-manager",
    "arch" => "networkmanager",
})
multipack({
    "ubuntu" => "redshift-gtk",
    "arch" => "redshift",
})
multipack "light-locker"
multipack "nitrogen"
multipack "compton"
multipack "rxvt-unicode" # urxvt
multipack "zsh"
multipack "firefox"
multipack "nautilus"
multipack "scrot"
multipack({
    "ubuntu" => "xcalib",
    "arch" => "aur:xcalib",
})
multipack "lightdm" # dm-tool
multipack({
    "ubuntu" => "x11-xserver-utils",
    "arch" => [
        "xorg-xmodmap",
        "xorg-xset",
    ],
})
multipack({
    "ubuntu" => "recipe:desktop::xcape",
    "arch" => "aur:xcape",
})
multipack({
    "ubuntu" => "recipe:desktop::rofi",
    "arch" => "rofi",
})

# Custom Utils that I wrote
include_recipe "desktop::pleb_ui"

# i3 with Gaps
multipack({
    "ubuntu" => "recipe:desktop::i3-gaps",
    "arch" => "aur:i3-gaps-next-git",
})
