template File.join node[:xresources_dir], "rofi.Xresources" do
    user node[:user]
    group node[:user]
    mode 0644
    source "xresources.erb"
    variables ({
        :application => "rofi",
        :settings => node[:rofi][:xresources],
    })
end

##################################
# Install Rofi based on platform #
##################################
case node[:platform]
when "ubuntu"
    multipack [
        "libxinerama1",
        "libxinerama-dev",
        "libxft2",
        "libpango-1.0-0",
        "libpangocairo-1.0-0",
        "libpango1.0-dev",
        "libcairo2",
        "libcairo2-dev",
        "libglib2.0-0",
        "libglib2.0-dev",
        "libx11-6",
        "libx11-dev",
        "libstartup-notification0",
        "libstartup-notification0-dev",
        "libxkbcommon0",
        "libxkbcommon-dev",
        "libxkbcommon-x11-0",
        "libxkbcommon-x11-dev",
        "libxcb1",
        "libxcb1-dev",
        "libx11-xcb1",
        "libx11-xcb-dev",
        "libxcb-util1",
        "libxcb-util0-dev",
        "dh-autoreconf",
    ]

    # sync rofi with repo
    git node[:rofi][:src] do
        repository node[:rofi][:git]
        user node[:user]
        group node[:user]
        # TODO:
        # Trusty doesn't have the packages for the 1.0!!
        revision "b10f40d8caa291e4cd26a2790479a2c769374869"
        notifies :run, "bash[compile_rofi]", :immediately
    end

    # compile rofi
    bash "compile_rofi" do
        cwd node[:rofi][:src]
        user node[:user]
        group node[:user]
        code <<-FIN
            rm -rf build  &&
            autoreconf -i &&
            mkdir build   &&
            cd build      &&
            ../configure  &&
            make
        FIN
        notifies :run, "bash[install_rofi]", :immediately
        action :nothing
    end

    # install rofi
    bash "install_rofi" do
        cwd node[:rofi][:src]
        code "make install"
        action :nothing
    end
when "arch"
    multipack "rofi"
end
