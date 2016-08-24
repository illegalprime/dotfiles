[
    {
        "ubuntu" => "rustc",
        "arch" => "rust",
    },
    {
        "ubuntu" => "cargo",
        "arch" => "aur:cargo-bin",
    },
].each do |to_install|
    multipack to_install
end

# Downlaod the source
git node[:rust][:src] do
    repository node[:rust][:git]
    user node[:user]
    group node[:user]
end

# Install racer
bash "install racer rust autocompleter" do
    command "cargo install racer"
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
end
