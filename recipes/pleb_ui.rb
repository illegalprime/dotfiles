[
    "notify-osd",
    {
        "ubuntu" => [
            "libsndfile1",
            "libsndfile1-dev",
        ],
        "arch" => "libsndfile",
    },
    {
        "ubuntu" => "libopenal-dev",
        "arch" => "openal",
    },
    {
        "ubuntu" => "libdbus-1-dev",
        "arch" => [],
    },
    {
        "ubuntu" => "libasound2-dev",
        "arch" => "alsa-lib",
    },
    {
        "ubuntu" => "libx11-xcb-dev",
        "arch" => [], # TODO
    },
    {
        "ubuntu" => "libxcb-randr0-dev",
        "arch" => [], # TODO
    },
    {
        "ubuntu" => "libxcb-xinerama0-dev",
        "arch" => [], # TODO
    },
].each do |to_install|
    multipack to_install
end

# sync syshooks with repo
git node[:syshooks][:src] do
    repository node[:syshooks][:git]
    user node[:user]
    group node[:user]
    notifies :run, "bash[clean_syshooks]", :immediately
end

# clean the git repo to build pleb_ui
bash "clean_syshooks" do
    cwd node[:syshooks][:src]
    user node[:user]
    group node[:user]
    code <<-FIN
        git clean -xdf
    FIN
    notifies :run, "bash[compile_syshooks]", :immediately
    action :nothing
end

# compiles and installs syshooks
bash "compile_syshooks" do
    cwd node[:syshooks][:src]
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
    code <<-FIN
        set -eu
        source #{node[:rust][:rust_env]}
        cargo build --release
        ln -sf #{node[:syshooks][:built_bin]} #{node[:syshooks][:bin]}
    FIN
    creates node[:syshooks][:built_bin]
end
