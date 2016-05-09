multipack "git"

bash "git-aliases" do
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
    code <<-FIN
        git config --global alias.co checkout
        git config --global alias.br branch
        git config --global alias.ci commit
        git config --global alias.st status
    FIN
end

bash "git-author" do
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
    code <<-FIN
        git config --global user.name '#{node[:name]}'
        git config --global user.email '#{node[:email]}'
    FIN
end
