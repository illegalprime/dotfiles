# Add extra scripts into the bin folder
[
    "bin/name",
]
.each do |extra|
    name = extra.split(File::SEPARATOR)[-1]
    cookbook_file File.join node[:personal_bin], name do
        owner node[:user]
        group node[:user]
        source extra
        mode 0775
    end
end

# Install extra utility packages
[
    "gimp",
    "file-roller",
    "gksu",
    "screen",
    "vlc",
    "zip",
    "unzip",
    "eog",
    "gnome-system-monitor",
    "gnome-disk-utility",
    "gparted",
    "baobab",
    "evince",
    "tig",
    "ranger",
    "jq",
    "fortune-mod",
    "cowsay",
    "ntfs-3g",
    {
        "ubuntu" => "x11-xserver-utils",
        "arch" => "xorg-xrandr",
    },
]
.each do |to_install|
    multipack to_install
end

# OS Specific
case node[:platform]
when "arch"
    multipack "aur:apacman"
end
