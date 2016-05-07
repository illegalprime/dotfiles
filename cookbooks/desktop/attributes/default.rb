default[:user] = "michael"
default[:home] = File.join "/home", node[:user]

default[:personal_bin] = File.join(node[:home], ".bin")
default[:pleb_ui] = File.join(node[:personal_bin], "pleb_ui")

default[:ppas] = []
