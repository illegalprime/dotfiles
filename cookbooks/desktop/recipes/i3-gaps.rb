multipack [
    "libxcb1-dev",
    "libxcb-keysyms1-dev",
    "libpango1.0-dev",
    "libxcb-util0-dev",
    "libxcb-icccm4-dev",
    "libyajl-dev",
    "libstartup-notification0-dev",
    "libxcb-randr0-dev",
    "libev-dev",
    "libxcb-cursor-dev",
    "libxcb-xinerama0-dev",
    "libxcb-xkb-dev",
    "libxkbcommon-dev",
    "libxkbcommon-x11-dev",
]

# sync i3-gaps with repo
git node[:i3][:src] do
    repository node[:i3][:git]
    user node[:user]
    group node[:user]
    checkout_branch "gaps"
    enable_checkout false
    notifies :run, "bash[compile_i3-gaps]", :immediately
end

# compile i3-gaps
bash "compile_i3-gaps" do
    cwd node[:i3][:src]
    user node[:user]
    group node[:user]
    code "make"
    notifies :run, "bash[install_i3-gaps]", :immediately
    action :nothing
end

# install i3-gaps
bash "install_i3-gaps" do
    cwd node[:i3][:src]
    code "make install"
    creates node[:i3][:bin]
    action :nothing
end
