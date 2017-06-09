[
    'neovim',
    'python-dev',
    'python-pip',
    'python3-dev',
    'python3-pip',

    # for X11 Clipboard support
    'xsel',

    # for YouCompleteMe
    'cmake',
    'clang',
    {
        'ubuntu' => [
            'python-dev',
            'python3-dev',
        ],
        'arch' => [
            'python2',
            'python',
        ],
    },
    {
        'ubuntu' => 'build-essential',
        'arch' => 'group:base-devel',
    },
    {
        'ubuntu' => 'libtinfo5',
        'arch' => 'aur:libtinfo-5',
    },
].each do |to_install|
    multipack to_install
end

bash 'install neovim python2 bindings' do
    code "pip2 install neovim"
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
    action :run
    not_if 'bash -c \'pip2 freeze | grep neovim\''
end

bash 'install neovim python3 bindings' do
    code "pip3 install neovim"
    user node[:user]
    group node[:user]
    environment "HOME" => node[:home]
    action :run
    not_if 'pip3 freeze | grep neovim'
end

# Create the vim notes directory
directories node[:home], node[:nvim][:notes][:dir] do
    user node[:user]
    group node[:user]
end

# Create the vim config directory
directories node[:home], node[:nvim][:config] do
    user node[:user]
    group node[:user]
end

# Create the vim autoload directory
directories node[:home], node[:nvim][:autoload] do
    user node[:user]
    group node[:user]
end

# Install Vim Plug plugin manager
remote_file node[:nvim][:plug][:src] do
    source node[:nvim][:plug][:url]
    owner node[:user]
    group node[:user]
    action :create
end

# add the init.vim
template node[:nvim][:init] do
    user node[:user]
    group node[:user]
    source 'nvim/init.vim'
    notifies :run, 'bash[update-nvim-plugins]', :immediately
end

# add utils
template node[:nvim][:utils] do
    user node[:user]
    group node[:user]
    source 'nvim/autoload/utils.vim'
    action :create
end

# Update all the plugins
bash 'update-nvim-plugins' do
    user node[:user]
    group node[:user]
    environment 'HOME' => node[:home]
    code 'nvim +PlugInstall +qall - '
end

# Compile you complete me
bash 'compile_ycm' do
    cwd node[:nvim][:ycm][:src]
    user node[:user]
    group node[:user]
    environment 'HOME' => node[:home]

    completers = []

    completers.push '--clang-completer'

    completers.push '--racer-completer' if node[:rust]

    completers.push '--tern-completer' if node[:nodejs]

    code <<-FIN
        set -eu
        git submodule update --init --recursive
        ./install.py #{completers.join(' ')}
    FIN
    creates 'third_party/ycmd/ycm_core.so'
end
