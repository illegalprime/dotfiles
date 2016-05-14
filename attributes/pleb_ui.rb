default[:syshooks][:git] = "https://github.com/illegalprime/syshooks.git"
default[:syshooks][:src] = File.join node[:personal_bin], "syshooks"
default[:syshooks][:bin] = File.join node[:personal_bin], "pleb_ui"
default[:syshooks][:built_bin] = File.join node[:syshooks][:src], "target/release/pleb_ui"
