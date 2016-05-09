template node[:zsh][:rc] do
    user node[:user]
    group node[:user]
    mode 0777
    source "zsh/rc.erb"
end

template node[:zsh][:env] do
    user node[:user]
    group node[:user]
    mode 0777
    source "zsh/env.erb"
end

[
    "zsh",
    "curl",
    {   # For http alias to make a webserver
        "ubuntu" => "python3",
        "arch" => "python",
    },
    "gnome-keyring",
    "sudo",
    "tar",
    "inotify-tools",
].each do |to_install|
    multipack to_install
end
# TODO: zsh git prompt
