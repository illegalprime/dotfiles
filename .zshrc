# This file is sourced by non-interactive and interactive zsh login shells.
# In an interactive shell, this is sourced before .zlogin.

if echo "$-" | grep "l" > /dev/null; then
else
    function precmd() {
        print -Pn "\e]2;$USER@%~\a"
        print -Pn "\033]0;$USER@%~\007"
    }

    function preexec() {
        print -Pn "\e]2;$1\a"
        print -Pn "\033]0;$1\007"
    }

    function search_cmd_all() {
        # Maybe better than pacman -Ss?
        # pkgfile -s "$1"
        if hash pacman 2>/dev/null; then
            pacman -Ss "$1"
        elif hash apt-file 2>/dev/null; then
            apt-file search "$1"
        fi
    }

    function command_not_found_handler() {
        CMDS=$(search_cmd_all $1)
        echo "$@ not found... Try installing:"
        echo "$CMDS"
    }
fi

###########
# Sources #
###########

source ~/Programs/zsh-git-prompt/zshrc.sh
# source /usr/share/nvm/init-nvm.sh

################
# Autocomplete #
################

# Autocomplete.
autoload -U compinit promptinit
compinit

# Use an autocomplete cache to speed things up.
zstyle ':completion::completion:*' use-cache 1
zstyle ':completion::complete:*' use-cache 1

# Do completions of thins like partial paths.
setopt completeinword

# Autocomplete entry for killall.
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

##########
# Colors #
##########

# Load colors.
autoload colors && colors

# Load colors into environment variables.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

# $RESET is used to reset colors to their normal value.
eval RESET='$reset_color'

# Ls colors.

eval `dircolors`
alias ls="ls -F --color=auto"

############
# Globbing #
############

# Use extended (better) globbing.
setopt extendedglob

# Ignore case while globbing.
unsetopt caseglob

#######
# Git #
#######

# Get the branch name of a path.
git_branch_name() {
    TARGET="$@"
    if git_branch "$TARGET"
    then
        echo "`git rev-parse --abbrev-ref HEAD`"
    else
        echo ""
    fi
}

############
# History #
###########

# Save timestamps and runtimes to the history file.
setopt extendedhistory

# All shells immediatly see new history from other shells.
# setopt sharehistory

###############
# Compilation #
###############

autoload -U zrecompile

#################
# Word matching #
#################

# We use this to tell zsh what qualifies as a word.
autoload select-word-style

# Shell mode for word detection.
select-word-style shell

#######
# VIM #
#######

# Vim mode.
# bindkey -v

##############
# Statistics #
##############

# Auto report program time statistics for programs that take longer than 10 seconds to run.
REPORTTIME=10

##########
# Prompt #
##########

# Setup prompt.
autoload -U promptinit
promptinit

# Extended PS1 and RPS1 substitution.
setopt promptsubst

# Prompt setup.
export PS_OPEN='%b%f%k%B%F{red}['
export PS_CLOSE='%F{red}]%b%f%k'

export GIT_PROMPT_EXECUTABLE="haskell"
export GIT_PROMPT='%b%f$(git_super_status)'
export PS_PWD="$PS_OPEN%B%F{cyan}%1~%B%F{white}${GIT_PROMPT}%B%F${PS_CLOSE}"
export PS_TTY="$PS_OPEN%B%F{yellow}%l$PS_CLOSE"
export PS_USER="$PS_OPEN%B%F{green}%n$PS_CLOSE"
export PS_HOST="$PS_OPEN%B%F{green}%m$PS_CLOSE"
export PS_TIME="$PS_OPEN%B%F{yellow}%T$PS_CLOSE"
export PS_PROMPT='%B%F{red}$%b%f%k'
export PS_VI_NORMAL="$PS_OPEN%B%F{yellow}NORMAL$PS_CLOSE"
#export PS_VI_INSERT="$PS_OPEN%B%F{yellow}INSERT$PS_CLOSE"
export PS_VI_INSERT=""


# function zle-line-init zle-keymap-select {
#    export RPS1="${${KEYMAP/vicmd/$PS_VI_NORMAL}/(main|viins)/$PS_VI_INSERT}"
#    zle reset-prompt
# }

PS_FIRST=
if [[ $SSH_CLIENT || $SSH_TTY ]]; then
    PS_FIRST="$PS_HOST"
else
    PS_FIRST="$PS_USER"
fi

export PS1="$PS_FIRST $PS_PWD $PS_PROMPT "
# export PS1="$PS_USER $PS_TTY $PS_PWD $PS_PROMPT "

export RPS1="${${KEYMAP/vicmd/$PS_VI_NORMAL}/(main|viins)/$PS_VI_INSERT}"
#zle -N zle-line-init
#zle -N zle-keymap-select

#########
# Alias #
#########

alias please='sudo $(fc -ln -1)'
alias http='python3 -m http.server'
alias cde='cd ~michael/cde'
alias again='until $(fc -ln -1); do :; done'
alias clbin="curl -F 'clbin=<-' https://clbin.com"

function targz() {
    tar -zcvf "${1}.tar.gz" "${1}"
}

function watch() {
    while :; do
        inotifywait -e close_write "$1"
        RUN=$(echo $@ | cut -d " " -f2-)
        echo "Running $RUN..."
        eval "$RUN"
    done
}

PATH="${PATH}:/home/michael/bin"

#############
# Variables #
#############

export EDITOR=vim
export ANDROID_HOME=/home/michael/Programs/android-sdk-linux
export RUST_SRC_PATH=/home/michael/Programs/rust/src
export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')

###############################
## Home & End Keys hopefully ##
###############################

#autoload zkbd
#source /home/michael/.zkbd/rxvt-unicode-256color-:0

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

#########
# Final #
#########
if [[ $PWD = $HOME ]]; then
    cd cde
fi
