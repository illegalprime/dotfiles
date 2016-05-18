multipack ({
    "ubuntu" => "atom",
    "arch" => "aur:atom-editor",
}) do
    build_user node[:user]
    build_group node[:user]
    build_dir "/tmp/atom-editor"
    environment "HOME" => node[:home]
    action :sync
end

bash "install atom packages" do
    code "apm install #{node[:atom][:packages].join(" ")}"
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
end

template node[:atom][:config] do
    owner node[:user]
    group node[:user]
    source "atom.config.erb"
end
