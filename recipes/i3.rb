# Install i3 extra utils
[
    "i3status",
    "nitrogen",
    "rxvt-unicode", # urxvt
    {   # gnome terminal is growing on me
        "ubuntu" => "gnome-terminal",
        "arch" => "gnome-terminal",
    },
    "nautilus",
    "scrot",
    "recipe:desktop::pleb_ui", # Custom Utils that I wrote
    "recipe:desktop::rofi",
    node[:i3][:font][:package], # current font
    {   # to be able to set caps to control
        "ubuntu" => "x11-xkb-utils",
        "arch" => "xorg-setxkbmap",
    },
    {   # For a bunch of icons
        "ubuntu" => "fonts-font-awesome",
        "arch" => "aur:ttf-font-awesome",
    },
    {
        "ubuntu" => "redshift-gtk",
        "arch" => [
            "python-xdg",
            "python-gobject",
            "librsvg",
            "redshift",
        ],
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

bash 'disable menubar in gnome-terminal' do
  code 'gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false'
  not_if '[ $(gsettings get org.gnome.Terminal.Legacy.Settings default-show-menubar) = false ]'
  user node[:user]
  group node[:user]
  environment "HOME" => node[:home]
  action :run
end

bash 'set the default font in gnome terminal' do
  code <<-FIN
    set -e
    # get the profile things
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    profile=${profile:1:-1}

    # don't use the system font
    gsettings set \
      "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
      use-system-font false

    # set the default font
    gsettings set \
      "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
      font 'SauceCodePro Nerd Font 12'
  FIN
  not_if <<-FIN
    set -e
    # get the profile things
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    profile=${profile:1:-1}

    # don't use the system font
    [ $(gsettings get \
      "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
      use-system-font) = false ]

    # set the default font
    gsettings get \
      "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" \
      font | grep 'SauceCodePro Nerd Font'
  FIN
  user node[:user]
  group node[:user]
  environment "HOME" => node[:home]
  action :run
end

