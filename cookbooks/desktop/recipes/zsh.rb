package "zsh"
package "curl"
package "python3"
package "gnome-keyring"
package "sudo"
package "tar"
package "inotify-tools"

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
