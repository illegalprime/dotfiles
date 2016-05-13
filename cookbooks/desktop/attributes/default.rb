default[:user] = "michael"
default[:home] = File.join "/home", node[:user]
default[:name] = "Michael Eden"
default[:email] = "themichaeleden@gmail.com"
default[:shell] = "/bin/bash"

font = :oxygen
default[:personal_bin] = File.join node[:home], ".bin"
default[:cde] = File.join node[:home], "cde"
default[:xresources_dir] = File.join node[:home], ".Xresources.d"
default[:wifi] = wireless_ifaces[0]

# TODO: Does not belong here:
default[:nodejs_bin] = File.join node[:personal_bin], "node_modules/.bin"
default[:pleb_ui] = File.join node[:personal_bin], "pleb_ui"

# Other apps specify how to perform actions
# Consumer apps like i3 keyboard shortcuts will use
# Current IPCs defined:
# -> :lock
# -> :browser
# -> :private_browser
# -> :file_explorer
default[:ipc] = {}
default[:ppas] = []
default[:startup] = []

default[:avail_fonts] = {
    :oxygen => {
        :family => "Oxygen Mono Regular",
        :package => {
            "ubuntu" => "ttf-oxygen-font-family",
            "arch" => "ttf-oxygen",
        },
    },
}
default[:font][:tag] = font
default[:font][:family] = default[:avail_fonts][font][:family]
