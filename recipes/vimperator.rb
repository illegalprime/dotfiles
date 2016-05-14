[
    "firefox",
    {
        "ubuntu" => "flashplugin-installer",
        "arch" => "flashplugin",
    },
].each do |to_install|
    multipack to_install
end

# Provide 'browser' and 'private_browser'
node[:ipc].store :browser, "firefox"
node[:ipc].store :private_browser, "firefox --private-window"

# Create the directory plugin
directories node[:home], node[:vimperator][:plugin] do
    owner node[:user]
    group node[:user]
end

cookbook_file File.join node[:vimperator][:plugin], "_smooziee.js" do
    owner node[:user]
    group node[:user]
    source "vimperator/plugin/_smooziee.js"
end

template node[:vimperator][:rc] do
    owner node[:user]
    group node[:user]
    source "vimperatorrc.erb"
end
