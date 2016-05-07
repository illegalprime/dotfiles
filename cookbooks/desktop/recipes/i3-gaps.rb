package "libxcb1-dev"
package "libxcb-keysyms1-dev"
package "libpango1.0-dev"
package "libxcb-util0-dev"
package "libxcb-icccm4-dev"
package "libyajl-dev"
package "libstartup-notification0-dev"
package "libxcb-randr0-dev"
package "libev-dev"
package "libxcb-cursor-dev"
package "libxcb-xinerama0-dev"
package "libxcb-xkb-dev"
package "libxkbcommon-dev"
package "libxkbcommon-x11-dev"

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
