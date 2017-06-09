[
    "bluez",
    "blueman",
]
.each do |to_install|
    multipack to_install
end

service "bluetooth" do
    action :enable
end

node[:startup].push "blueman-applet"
