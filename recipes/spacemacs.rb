multipack 'emacs'
multipack 'opam'

# configure ocaml
bash 'configure opam' do
  code 'opam init -y'
  user node[:user]
  group node[:user]
  environment "HOME" => node[:home]
  action :run
  creates File.join node[:home], '.opam/config'
end

# install spacemacs
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


