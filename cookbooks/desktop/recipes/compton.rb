multipack "compton"

# Create a simple config file
template node[:compton][:config] do
    user node[:user]
    group node[:user]
    source "compton/config.erb"
end
