default[:atom][:config] = File.join node[:home], ".atom", "config.cson"
default[:atom][:tab_length] = 4
default[:atom][:themes] = [
    "dark-flat-ui",
    "monokai-seti",
]
default[:atom][:packages] = node[:atom][:themes] + [
    "vim-mode",
    "autocomplete-paths",
    "autocomplete-python",
    "language-rust",
    "linter-rust",
    "racer",
    "linter",
    "language-latex",
    "pdf-view",
]


node[:ppas].push "ppa:webupd8team/atom"
