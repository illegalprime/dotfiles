[
    "firefox",
    # for 'installing' extensions
    "unzip",
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

##################################
# Install Extensions for Firefox #
##################################
{
    "{03cb16aa-4675-11e5-b233-213b1d5d46b0}" =>
        656100,
    "{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}" =>
        1865,
# vimperator has trouble for some reason
#     "{ec8030f7-c20a-464f-9b0e-13a3a9e97384}" =>
#         4891,
}
.each_pair
.map do |id, num|
    moz_config = node[:vimperator][:firefox_config]
    [
        # TODO: this probably doesn't exist before first run?
        Dir[File.join moz_config, "*.default"]
        .map do |dir|
            File.join dir, "extensions", id
        end
        .reject do |dir|
            Dir.exists? dir
        end,
        id,
        "https://addons.mozilla.org/firefox/downloads/latest/" \
        "#{num}/platform:2/addon-#{num}-latest.xpi",
    ]
end
.each do |dirs, id, url|
    zipped_extension = File.join "/tmp", "firefox-#{id}.zip"

    remote_file zipped_extension do
        source url
        owner node[:user]
        group node[:user]
        action :create_if_missing
    end

    dirs.each do |extension_dir|
        bash "install firefox extension into #{extension_dir}" do
            user node[:user]
            group node[:user]
            code "unzip '#{zipped_extension}' -d '#{extension_dir}'"
        end
    end
end
