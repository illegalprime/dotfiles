node[:ppas].push("ppa:hansjorg/rust")

default[:rust][:git] = "https://github.com/rust-lang/rust.git"
default[:rust][:src] = File.join node[:personal_bin], "rust"
default[:rust][:stdlib] = File.join node[:rust][:src], "src"