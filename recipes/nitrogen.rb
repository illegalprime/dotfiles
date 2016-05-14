multipack "nitrogen"

directory node[:nitrogen][:config] do
    owner node[:user]
    group node[:user]
end

# Configure the user background with nitrogen
template File.join node[:nitrogen][:config], "bg-saved.cfg" do
    user node[:user]
    group node[:user]
    source "nitrogen-bg.cfg.erb"
end

# copy over the current desktop to its place
cookbook_file node[:nitrogen][:background][:path] do
    owner node[:user]
    group node[:user]
    source node[:nitrogen][:current]
end
