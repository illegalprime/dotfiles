# Install it
multipack({
    "ubuntu" => "network-manager",
    "arch" => "networkmanager",
})

# Autostart the gtk applet
node[:startup].push "nm-applet"

# Start the service
service ({
    "ubuntu" => "network-manager",
    "arch" => "NetworkManager",
})[node[:platform]] do
    action :enable
end
