multipack 'emacs'
multipack 'opam'

git File.join node[:home], '.emacs.d' do
    repository 'https://github.com/syl20bnr/spacemacs'
    user node[:user]
    group node[:user]
end

# add configuration
template File.join node[:home], '.spacemacs' do
    user node[:user]
    group node[:user]
    source 'spacemacs.erb'
    action :create
end


