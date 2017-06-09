default[:i3][:git] = "https://github.com/Airblader/i3.git"
default[:i3][:src] = File.join node[:personal_bin], "i3-gaps"
default[:i3][:bin] = "/usr/bin/i3"
default[:ppas].push "ppa:aguignard/ppa"
