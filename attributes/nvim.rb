# Add the latest vim ppa
default[:ppas].push "ppa:neovim-ppa/unstable"

default[:nvim][:config] = File.join node[:home], ".config/nvim"
default[:nvim][:autoload] = File.join node[:nvim][:config], "autoload"
default[:nvim][:init] = File.join node[:nvim][:config], "init.vim"
default[:nvim][:utils] = File.join node[:nvim][:autoload], "utils.vim"

default[:nvim][:plug][:url] = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
default[:nvim][:plug][:src] = File.join node[:nvim][:autoload], "plug.vim"

default[:nvim][:notes][:dir] = File.join node[:home], "Documents/Notes"

default[:nvim][:ycm][:src] = File.join node[:nvim][:config], "plugged/YouCompleteMe"

