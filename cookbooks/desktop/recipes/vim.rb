[
    "vim",
    # For you complete me
    "cmake",
    "clang",
    {
        "ubuntu" => [
            "python-dev",
            "python3-dev",
        ],
        "arch" => [
            "python2",
            "python",
        ],
    },
    {
        "ubuntu" => "build-essential",
        "arch" => "group:base-devel",
    },
    {
        "ubuntu" => "libtinfo5",
        "arch" => "aur:libtinfo-5",
    },
].each do |to_install|
    multipack to_install
end

multipack "npm" do
    notifies :run, "bash[update-node]", :immediately
end

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
    notifies :run, "bash[update-vim-plugins]", :immediately
end

# Update all the plugins
bash "update-vim-plugins" do
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
    code <<-FIN
        set -eu
        yes | vim +PluginClean +qall
        vim +PluginInstall +qall
    FIN
end

# Compile you complete me
bash "compile_ycm" do
    cwd node[:vim][:ycm][:src]
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
    code <<-FIN
        set -eu
        ./install.py --clang-completer --tern-completer --racer-completer
    FIN
    creates "third_party/ycmd/ycm_core.so"
end

# Update node to latest when one is installed
bash "update-node" do
    code <<-FIN
        set -eu
        npm install -g npm
        npm install -g n
        n latest
    FIN
    action :nothing
end
