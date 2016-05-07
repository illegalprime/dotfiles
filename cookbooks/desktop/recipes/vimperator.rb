package "firefox"

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
