default[:zsh][:rc]  = File.join node[:home], ".zshrc"
default[:zsh][:env] = File.join node[:home], ".zshenv"

default[:zsh][:git_prompt][:git] = "https://github.com/olivierverdier/zsh-git-prompt.git"
default[:zsh][:git_prompt][:src] = File.join node[:personal_bin], "zsh-git-prompt"
default[:zsh][:git_prompt][:rc] = File.join node[:zsh][:git_prompt][:src], "zshrc.sh"
default[:zsh][:git_prompt][:use_haskell] = true

default[:zsh][:git_prompt][:style] = {
    :prefix    => "(",
    :suffix    => ")",
    :separator => "|",
    :branch    => "%{$fg_bold[magenta]%}",
    :staged    => "%{$fg[red]%}%{•%G%}",
    :conflicts => "%{$fg[red]%}%{✖%G%}",
    :changed   => "%{$fg[blue]%}%{✚%G%}",
    :behind    => "%{↓%G%}",
    :ahead     => "%{↑%G%}",
    :untracked => "%{…%G%}",
    :clean     => "%{$fg_bold[green]%}%{✔%G%}",
}

normal[:zsh][:paths] = [
    node[:personal_bin],
    node[:nodejs_bin],
]

normal[:zsh][:sharehistory] = false
