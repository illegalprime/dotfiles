default[:user] = "michael"
default[:home] = File.join "/home", node[:user]
default[:name] = "Michael Eden"
default[:email] = "themichaeleden@gmail.com"

default[:personal_bin] = File.join node[:home], ".bin"
default[:cde] = File.join node[:home], "cde"

default[:node_bin] = File.join node[:personal_bin], "node_modules/.bin"
default[:pleb_ui] = File.join node[:personal_bin], "pleb_ui"

default[:wifi] = wireless_ifaces[0]

default[:ppas] = []
default[:startup] = []
