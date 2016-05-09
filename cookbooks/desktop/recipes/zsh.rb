multipack([
    "zsh",
    "curl",
    "python3",
    "gnome-keyring",
    "sudo",
    "tar",
    "inotify-tools",
])

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

# TODO: zsh git prompt
