# install libraries to build
package "libxtst-dev"
package "libx11-dev"
package "libxtst6"
package "libx11-6"

# sync xcape with repo
git node[:xcape][:src] do
    repository "https://github.com/alols/xcape.git"
    user node[:user]
    group node[:user]
    notifies :run, "bash[compile_xcape]", :immediately
end

# compile xcape
bash "compile_xcape" do
    cwd node[:xcape][:src]
    user node[:user]
    group node[:user]
    code "make"
    notifies :run, "bash[install_xcape]", :immediately
    action :nothing
end

# install xcape
bash "install_xcape" do
    cwd node[:xcape][:src]
    code "make install"
    action :nothing
end
