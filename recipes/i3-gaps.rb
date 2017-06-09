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
    "libxcb-xrm-dev",
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

    code <<-FIN
        # compile & install
        autoreconf --force --install
        rm -rf build/
        mkdir -p build && cd build/

        # Disabling sanitizers is important for release versions!
        # The prefix and sysconfdir are, obviously, dependent on the distribution.
        ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
        make
    FIN

    creates (File.join node[:i3][:src], 'build/i3')
end

# install i3-gaps
bash "install_i3-gaps" do
    cwd (File.join node[:i3][:src], 'build')
    code "make install"
    creates node[:i3][:bin]
end
