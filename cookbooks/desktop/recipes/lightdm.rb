multipack([
    "lightdm",
    "light-locker",
])

# Match the greeter with the locker
node[:startup].push("light-locker --lock-on-suspend")
# Provide IPC lock, tell i3 how to lock the screen
node.normal[:ipc][:lock] = "dm-tool lock"

service "lightdm" do
    action :enable
end

if node[:platform] == "ubuntu"
    node[:startup].push(
        "gsettings set org.gnome.desktop.lockdown disable-lock-screen true"
    )
end
