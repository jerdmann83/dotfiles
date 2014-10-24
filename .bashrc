# ~/.bashrc: executed by bash(1) for non-login shells#.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set 256 color support
export TERM=xterm-256color

# add the git stuff
GIT_PS1_SHOWDIRTYSTATE=true
. ~/git-prompt.sh
. ~/git-completion.sh

# set a simpler prompt for emacs subshells
if [ -z $EMACS ]; then
    PS1='\[\e[1;32m\]\u@\h\[\e[1;34m\]$(__git_ps1)\[\e[1;32m\] \w\r\n\[\033[0m\]>'
else
    PS1='>'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more aliases
alias emacs='emacs -nw'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias fixdns='sudo resolvconf -u'
alias sb='source ~/.bashrc'
alias eb='vim ~/.bashrc'
alias gimme='sudo apt-get install'
alias vcloud='~/debesys/run ~/debesys/deploy/chef/scripts/vcloud_server.py'
alias bump='~/debesys/run python ~/debesys/deploy/chef/scripts/bump_cookbook_version.py'
alias deploy='~/debesys/run python ~/debesys/deploy/chef/scripts/request_deploy.py'
alias ack='ack-grep'
alias eclipse='GTK2_RC_FILES=~/.gtkrc ~/eclipse/eclipse'
alias getdotfiles='pushd . && cd ~/.dotfiles && git pull && popd'
alias retroterm='~/cool-retro-term/cool-retro-term'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.keys ]; then
    . ~/.keys
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR="vim"

# debesys stuff
alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
alias run='`git rev-parse --show-toplevel`/run'
alias gits='git-sync_'

# vcd stuff
export INTAD_USER=jerdmann
export VCD_ORG=Dev_General

export AWS_DEFAULT_REGION='us-east-1'
export JENKINS_USER='jason.erdmann@tradingtechnologies.com'

# ttnet project dirs
alias cdspl='cd ~/ttnet/monitoring/splunk'
alias cdici='cd ~/ttnet/monitoring/icinga'
alias cdzab='cd ~/ttnet/monitoring/zabbix/misc_automation'
alias cdds='cd ~/ttnet/monitoring/scripts/centosDs'
alias cddeb='cd ~/debesys/deploy/chef/scripts'

# capslock is useless
setxkbmap -option ctrl:nocaps 2>/dev/null
