# install libraries to build
package "libxtst-dev"
package "libx11-dev"
package "libxtst6"
package "libx11-6"

# sync xcape with repo
git node[:xcape][:src] do
    repository "https://github.com/alols/xcape.git"
    notifies :run, "bash[compile_xcape]", :immediately
end

# compile and install xcape
bash "compile_xcape" do
    cwd node[:xcape][:src]
    code <<-FIN
        make && make install
    FIN
    creates node[:xcape][:bin]
end
