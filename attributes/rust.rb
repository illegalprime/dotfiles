default[:rust][:cargo][:config] = File.join node[:home], ".cargo"
default[:rust][:rust_env] = File.join node[:home], ".cargo/env"
default[:rust][:racer_bin] = File.join node[:home], ".cargo/bin/racer"
default[:rust][:stdlib] = File.join node[:home], ".rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"
