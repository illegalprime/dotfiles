[
    {
        "ubuntu" => "xserver-xorg",
        "arch" => [
            "xf86-input-evdev",
            "xorg-server",
        ],
    },
    {
        "ubuntu" => "xserver-xorg-input-synaptics",
        "arch" => "xf86-input-synaptics",
    },
].each do |to_install|
    multipack to_install
end

template node[:synaptics][:config] do
    source "synaptics/touchpad.conf.erb"
end
