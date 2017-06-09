multipack "git"

git_config = File.join node[:home], '.gitconfig'

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

    not_if <<-FIN
        grep '^\\s*co = checkout\\s*$' #{git_config} && \
        grep '^\\s*br = branch\\s*$' #{git_config} && \
        grep '^\\s*ci = commit\\s*$' #{git_config} && \
        grep '^\\s*st = status\\s*$' #{git_config}
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

    not_if <<-FIN
        grep '^\\s*name = #{node[:name]}\\s*$' #{git_config} && \
        grep '^\\s*email = #{node[:email]}\\s*$' #{git_config}
    FIN
end

