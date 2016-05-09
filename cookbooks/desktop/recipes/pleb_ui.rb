[
    {
        "ubuntu" => [
            "libsndfile1",
            "libsndfile1-dev",
        ],
        "arch" => "libsndfile",
    },
    {
        "ubuntu" => "cargo-stable",
        "arch" => "aur:cargo-bin",
    },
].each do |to_install|
    multipack to_install
end

# sync syshooks with repo
git node[:syshooks][:src] do
    repository node[:syshooks][:git]
    user node[:user]
    group node[:user]
    notifies :run, "bash[compile_syshooks]", :immediately
end

# compiles and installs syshooks
bash "compile_syshooks" do
    cwd node[:syshooks][:src]
    user node[:user]
    group node[:user]
    code <<-FIN
        set -eu
        cargo build --release
        ln -sf #{node[:syshooks][:built_bin]} #{node[:syshooks][:bin]}
    FIN
    action :nothing
end