multipack "irssi"

template node[:irssi][:config] do
    user node[:user]
    group node[:user]
    source "irssi/config.erb"
end
