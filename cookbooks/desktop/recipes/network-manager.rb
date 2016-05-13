# Install it
[
    {
        "ubuntu" => "network-manager",
        "arch" => "networkmanager",
    },
    {
        "ubuntu" => "network-manager-gnome",
        "arch" => "network-manager-applet",
    },
].each do |to_install|
    multipack to_install
end

# Autostart the gtk applet
node[:startup].push "nm-applet"

# Start the service
service ({
    "ubuntu" => "network-manager",
    "arch" => "NetworkManager",
})[node[:platform]] do
    action :enable
end
