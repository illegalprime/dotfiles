# Cookbook Name:: desktop
# Recipe:: i3
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
[
    "i3status",
    "nitrogen",
    "rxvt-unicode", # urxvt
    "nautilus",
    "scrot",
    "recipe:desktop::pleb_ui", # Custom Utils that I wrote
    "recipe:desktop::rofi",
    node[:i3][:font][:package], # current font
    {   # For a bunch of icons
        "ubuntu" => "fonts-font-awesome",
        "arch" => "aur:ttf-font-awesome",
    },
    {
        "ubuntu" => "redshift-gtk",
        "arch" => "redshift",
    },
    {
        "ubuntu" => "xcalib",
        "arch" => "aur:xcalib",
    },
    {
        "ubuntu" => "x11-xserver-utils",
        "arch" => [
            "xorg-xmodmap",
            "xorg-xset",
        ],
    },
    {
        "ubuntu" => "recipe:desktop::xcape",
        "arch" => "aur:xcape",
    },
    {   # i3 with Gaps
        "ubuntu" => "recipe:desktop::i3-gaps",
        "arch" => "aur:i3-gaps-next-git",
    },
].each do |to_install|
    multipack to_install
end
