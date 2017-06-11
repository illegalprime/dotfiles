directory 'create ~/.zsh' do
    path File.join node[:home], '.zsh'
    owner node[:user]
    group node[:user]
    mode 0755
end

template node[:zsh][:rc] do
    user node[:user]
    group node[:user]
    mode 0755
    source 'zsh/rc.erb'
end

template node[:zsh][:init] do
    user node[:user]
    group node[:user]
    mode 0755
    source 'zsh/init.erb'
end

template node[:zsh][:env] do
    user node[:user]
    group node[:user]
    mode 0755
    source 'zsh/env.erb'
end

git File.join node[:home], '.zsh/zgen' do
    repository 'https://github.com/tarjoilija/zgen.git'
    user node[:user]
    group node[:user]
end

# sync git-zsh-status with repo
git node[:zsh][:git_prompt][:src] do
    repository node[:zsh][:git_prompt][:git]
    user node[:user]
    group node[:user]
end

# This is much faster than plain prompt
if node[:zsh][:git_prompt][:use_haskell]
    # Add ppa to ubuntu for haskell's stack
    case node[:platform]
    when 'ubuntu'
        apt_repository 'stackage' do
            uri 'http://download.fpcomplete.com/ubuntu'
            components ['main']
            distribution node[:lsb][:codename]
            key '575159689BEFB442'
            keyserver 'keyserver.ubuntu.com'
            action :add
            deb_src false
            notifies :run, 'apt_update[apt-update-now]', :immediately
        end
    end

    # Install haskell's stackage and such
    multipack({
        'ubuntu' => 'stack',
        'arch' => [
            'stack',
            'ghc',
        ],
    })

    # Compile the zsh git prompt with haskell
    bash 'compile_zsh-git' do
        wd = node[:zsh][:git_prompt][:src]
        cwd wd
        user node[:user]
        group node[:user]
        environment 'HOME' => node[:home]
        code <<-FIN
            set -euo pipefail
            stack setup
            stack build
            stack install
        FIN
        creates File.join wd, 'src/.bin/gitstatus'
    end
end

[
    'zsh',
    'curl',
    {   # For http alias to make a webserver
        'ubuntu' => 'python3',
        'arch' => 'python',
    },
    'gnome-keyring',
    'keychain',
    'sudo',
    'tar',
    'inotify-tools',
].each do |to_install|
    multipack to_install
end
