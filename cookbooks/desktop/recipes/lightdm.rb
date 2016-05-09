multipack([
    "lightdm",
    "light-locker",
])

node[:startup].push("light-locker --lock-on-suspend")
node[:ipc][:lock] = "dm-tool lock"

service "lightdm" do
    action :enable
end
