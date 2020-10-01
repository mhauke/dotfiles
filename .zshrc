#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

setopt autocd extendedglob autopushd pushdignoredups
unsetopt appendhistory beep nomatch notify
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/mh/.zshrc'
autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=10000

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors

## Aliases
alias -s {yml,yaml}=vim
alias -s {json}=vim
alias -g G='| grep -i'
alias d='dirs -v | head -10'
alias zshconfig="nano ~/.zshrc"
alias dusch="du -sch * | sort -k1 -h "
alias mhmux='tmux attach-session -t mh || tmux new-session -s mh'
alias g='git'
alias free="free -m"
alias df="df -h"
alias vi="vim"
alias ll="ls -hlF --time-style=long-iso"
alias la="ls -hAlF --time-style=long-iso"
alias mkdir="mkdir -p"
alias ..='cd ..' # Go up one directory
alias ...='cd ../..' # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias cpp='rsync --progress -ah'
alias doch='sudo "$BASH" -c "$(history -p !!)"'
alias ip='ip -color'
alias ips='ip -brief a'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

## Functions
function extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function mkdircd () { mkdir "$@" && eval cd "\"\$$#\""; }

# ssh wrapper that rename current tmux window to the hostname of the
# remote host.
function ssh() {
    # Do nothing if we are not inside tmux or ssh is called without arguments
    if [[ $# == 0 || -z $TMUX ]]; then
        command ssh $@
        return
    fi
    # The hostname is the last parameter 
    local remote="${@: -1}"
    local old_name="$(tmux display-message -p '#W')"
    local renamed=0
    # Save the current name
    if [[ $remote != -* ]]; then
        renamed=1
        tmux rename-window $remote
    fi
    command ssh $@
    sleep 2
    if [[ $renamed == 1 ]]; then
        tmux rename-window "$old_name"
    fi
}


