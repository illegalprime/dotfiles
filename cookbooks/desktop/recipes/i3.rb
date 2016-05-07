# Cookbook Name:: desktop
# Recipe:: i3
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

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
package "network-manager" # nm-applet
package "redshift-gtk"
package "light-locker"
package "nitrogen"
package "compton"
package "rxvt-unicode" # urxvt
package "zsh"
package "firefox"
package "nautilus"
package "scrot"
package "xcalib"
package "lightdm" # dm-tool
package "x11-xserver-utils" # xmodmap, xset

# Install less popular utils
include_recipe "desktop::xcape"
include_recipe "desktop::rofi"

# Custom Utils
# TODO: pleb_ui

# i3 with Gaps
include_recipe "desktop::i3-gaps"
