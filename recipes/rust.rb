multipack({
    "ubuntu" => "rust-stable",
    "arch" => "rust",
 })

# Downlaod the source
git node[:rust][:src] do
    repository node[:rust][:git]
    user node[:user]
    group node[:user]
end