default[:zsh][:rc]  = File.join node[:home], ".zshrc"
default[:zsh][:env] = File.join node[:home], ".zshenv"

default[:zsh][:git_prompt][:git] = "https://github.com/olivierverdier/zsh-git-prompt.git"
default[:zsh][:git_prompt][:src] = File.join node[:personal_bin], "zsh-git-prompt"
default[:zsh][:git_prompt][:rc] = File.join node[:zsh][:git_prompt][:src], "zshrc.sh"

normal[:zsh][:paths] = [
    node[:personal_bin],
    node[:nodejs_bin],
]

normal[:zsh][:sharehistory] = false
