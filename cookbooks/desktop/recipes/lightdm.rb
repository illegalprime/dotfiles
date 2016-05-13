[
    "lightdm",
    "light-locker",
    {
        "ubuntu" => "xserver-xorg",
        "arch" => [
            "xf86-input-evdev",
            "xorg-server",
        ],
    },
    {
        "ubuntu" => "unity-greeter",
        "arch" => "lightdm-gtk-greeter",
    },
    {
        "ubuntu" => "xserver-xorg-video-intel",
        "arch" => "xf86-video-intel",
    },
].each do |to_install|
    multipack to_install
end

# Match the greeter with the locker
node[:startup].push "light-locker --lock-on-suspend"
# Provide IPC lock, tell i3 how to lock the screen
node[:ipc].store :lock, "dm-tool lock"

service "lightdm" do
    action :enable
end

if node[:platform] == "ubuntu"
    node[:startup].push "gsettings set org.gnome.desktop.lockdown disable-lock-screen true"
end
