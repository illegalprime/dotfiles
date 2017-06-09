# install rust through rustup
bash 'install-rust-cargo' do
    cwd '/tmp'
    user node[:user]
    group node[:user]
    environment 'HOME' => node[:home]

    code <<-FIN
        set -eu
        curl https://sh.rustup.rs -sSf > rustup.sh
        chmod +x rustup.sh
        ./rustup.sh -y
        rm -f rustup.sh
    FIN
    creates (File.join node[:home], ".rustup")
end

# install racer
bash 'install-rust-racer' do
    user node[:user]
    group node[:user]
    environment 'HOME' => node[:home]

    code <<-FIN
        source #{node[:rust][:rust_env]}
        cargo install racer
    FIN
    creates node[:rust][:racer_bin]
end

# download rust source
bash 'download-rust-source' do
    user node[:user]
    group node[:user]
    environment 'HOME' => node[:home]

    code <<-FIN
        source #{node[:rust][:rust_env]}
        rustup component add rust-src
    FIN
    creates node[:rust][:stdlib]
end

