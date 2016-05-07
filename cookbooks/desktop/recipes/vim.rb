package "vim"

# Create the vim notes directory
directories node[:home], node[:vim][:notes][:dir] do
    user node[:user]
    group node[:user]
end

# Create a directory for vundle
directories node[:home], node[:vim][:vundle][:src] do
    user node[:user]
    group node[:user]
end

# Needs to setup rust for autocomplete
include_recipe "desktop::rust"

# install vundle
git node[:vim][:vundle][:src] do
    repository node[:vim][:vundle][:git]
    user node[:user]
    group node[:user]
end

# add the vimrc
template node[:vim][:rc] do
    user node[:user]
    group node[:user]
    source "vimrc.erb"
    notifies :run, "bash[update-plugins]", :immediately
end

# Update all the plugins
bash "update-plugins" do
    user node[:user]
    group node[:user]
    code "vim +PluginInstall +qall"
    action :nothing
end

# TODO: Compile you complete me
# TODO: Add npm support, completion
