multipack "irssi"

directory node[:irssi][:config_dir] do
    owner node[:user]
    group node[:user]
end

template node[:irssi][:config] do
    user node[:user]
    group node[:user]
    source "irssi/config.erb"
end
