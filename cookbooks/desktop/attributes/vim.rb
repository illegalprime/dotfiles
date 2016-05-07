# Add the latest vim ppa
default[:ppas].push("ppa:pkg-vim/vim-daily")

default[:vim][:config] = File.join node[:home], ".vim"
default[:vim][:rc] = File.join node[:home], ".vimrc"

default[:vim][:vundle][:git] = "https://github.com/VundleVim/Vundle.vim.git"
default[:vim][:vundle][:src] = File.join node[:vim][:config], "bundle/Vundle.vim"

default[:vim][:notes][:dir] = File.join node[:home], "Documents/Notes"

default[:vim][:ycm][:src] = File.join node[:vim][:config], "bundle/YouCompleteMe"

normal[:vim][:plugins] = [
    "gmarik/Vundle.vim",
    "rust-lang/rust.vim",
    "Valloric/YouCompleteMe",
    "xolox/vim-misc",
    "xolox/vim-notes",
    "xuhdev/vim-latex-live-preview",
    "jelera/vim-javascript-syntax",
    "pangloss/vim-javascript",
    "nathanaelkane/vim-indent-guides",
    "Raimondi/delimitMate",
    "scrooloose/syntastic",
    "godlygeek/tabular",
    "plasticboy/vim-markdown",
    "easymotion/vim-easymotion",
    "terryma/vim-multiple-cursors",
    "Limvot/kraken.vim",
]
