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
    "light-locker",
    "nitrogen",
    "compton",
    "rxvt-unicode", # urxvt
    "zsh",
    "firefox",
    "nautilus",
    "scrot",
    "lightdm", # dm-tool
    "recipe:desktop::pleb_ui", # Custom Utils that I wrote
    {   # For nm-applet
        "ubuntu" => "network-manager",
        "arch" => "networkmanager",
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
    {
        "ubuntu" => "recipe:desktop::rofi",
        "arch" => "rofi",
    },
    {   # i3 with Gaps
        "ubuntu" => "recipe:desktop::i3-gaps",
        "arch" => "aur:i3-gaps-next-git",
    },
].each do |to_install|
    multipack to_install
end
