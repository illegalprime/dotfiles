default[:user] = `who am i`.split[0]
default[:home] = Dir.home

default[:personal_bin] = File.join(node[:home], ".bin")
default[:pleb_ui] = File.join(node[:personal_bin], "pleb_ui")
