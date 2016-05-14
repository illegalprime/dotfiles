# Add extra scripts into the bin folder
[
    "bin/name",
].each do |extra|
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
    "vlc",
    "zip",
    "unzip",
    "eog",
    "evince",
    "tig",
    "fortune-mod",
    "cowsay",
    {
        "ubuntu" => "x11-xserver-utils",
        "arch" => "xorg-xrandr",
    },
].each do |to_install|
    multipack to_install
end
