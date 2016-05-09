default[:user] = "michael"
default[:home] = File.join "/home", node[:user]
default[:name] = "Michael Eden"
default[:email] = "themichaeleden@gmail.com"

default[:personal_bin] = File.join node[:home], ".bin"
default[:cde] = File.join node[:home], "cde"

default[:node_bin] = File.join node[:personal_bin], "node_modules/.bin"
default[:pleb_ui] = File.join node[:personal_bin], "pleb_ui"

default[:wifi] = wireless_ifaces[0]
# Other apps specify how to perform actions
# Consumer apps like i3 keyboard shortcuts will use
# Current IPCs defined:
# -> :lock
default[:ipc] = {}

# Used in places like i3 to determine default apps
# -> :browser
# -> :private_browser
# -> :file_explorer

default[:ppas] = []
default[:startup] = []
