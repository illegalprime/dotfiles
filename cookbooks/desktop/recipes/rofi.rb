package "libxinerama1"
package "libxinerama-dev"
package "libxft2"
package "libpango-1.0-0"
package "libpangocairo-1.0-0"
package "libpango1.0-dev"
package "libcairo2"
package "libcairo2-dev"
package "libglib2.0-0"
package "libglib2.0-dev"
package "libx11-6"
package "libx11-dev"
package "libstartup-notification0"
package "libstartup-notification0-dev"
package "libxkbcommon0"
package "libxkbcommon-dev"
package "libxkbcommon-x11-0"
package "libxkbcommon-x11-dev"
package "libxcb1"
package "libxcb1-dev"
package "libx11-xcb1"
package "libx11-xcb-dev"
package "libxcb-util0"
package "libxcb-util0-dev"
package "dh-autoreconf"

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
