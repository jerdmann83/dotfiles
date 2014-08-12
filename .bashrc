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

# set the prompt a bit different if we're in an ssh session
if [ -n "$SSH_CLIENT" ]; then
    PS1='\[\e[1;34m\]\u@\h$(__git_ps1) \w\r\n\[\033[0m\]>'
else
    PS1='\[\e[1;32m\]\u@\h\[\e[1;34m\]$(__git_ps1)\[\e[1;32m\] \w\r\n\[\033[0m\]>'
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
alias em='emacsclient -n'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias fixdns='sudo resolvconf -u'
alias sb='source ~/.bashrc'
alias eb='em ~/.bashrc'
alias gimme='sudo apt-get install'
alias vcloud='cd ~/debesys && ./run deploy/chef/scripts/vcloud_server.py'
alias ack='ack-grep'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

# vpn function
function vpn {
    sudo /home/jason/.juniper_networks/ncsvc -h us-ttvpn.tradingtechnologies.com -u jerdmann -p $1 -r "TT VPN" -f /home/jason/.juniper_networks/tt.cert
}

# function for grabbing Splunk views
function grabview {
    scp 119.0.200.55:/opt/splunk/etc/apps/ttnet_operations/local/data/ui/views/$1 ~/ttnet/monitoring/splunk/deployment-apps/ttnet_operations/local/data/ui/views/
}

# function for grabbing the ttnet ops nav menus in Splunk
function grabnav {
    scp 119.0.200.55:/opt/splunk/etc/apps/ttnet_operations/local/data/ui/nav/default.xml ~/ttnet/monitoring/splunk/deployment-apps/ttnet_operations/local/data/ui/nav/
}

# function for showing all Icinga hosts that have a service state matching the arg passed
function geticinga {
    curl -u jerdmann -k "https://icinga/icinga/cgi-bin/status.cgi?host=all&type=detail&csvoutput" | grep "$1" | cut -f1 -d\; | sed "s/'//g" | sort -u
}

# debesys stuff
alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'

# vcd stuff
export INTAD_USER=jerdmann
export VCD_ORG=Dev_General

# ttnet project dirs
alias cdspl='cd ~/ttnet/monitoring/splunk'
alias cdici='cd ~/ttnet/monitoring/icinga'
alias cdzab='cd ~/ttnet/monitoring/zabbix/misc_automation'
alias cdds='cd ~/ttnet/monitoring/scripts/centosDs'
alias cddeb='cd ~/debesys/deploy/chef/scripts'

function git-sync_()
{
    usage="git-sync branch"
    if [ -z "$1" ]; then
        echo $usage
        return
    fi

    echo "pushd `git rev-parse --show-toplevel`";
    pushd `git rev-parse --show-toplevel`;
    if [ $? != 0 ]; then
        echo "Aborting."
        return
    fi
    echo "git remote prune origin";
    git remote prune origin;
    if [ $? != 0 ]; then
        echo "Aborting."
        return
    fi
    echo "git checkout $1";
    git checkout "$1";
    if [ $? != 0 ]; then
        echo "Aborting."
        return
    fi
    echo "git pull";
    git pull;
    if [ $? != 0 ]; then
        echo "Aborting."
        return
    fi
    echo "git submodule init";
    git submodule init;
    if [ $? != 0 ]; then
        echo "Aborting."
        return
    fi
    echo "git submodule update";
    git submodule update;
    if [ $? != 0 ]; then
        echo "Aborting."
        return
    fi
    echo "popd";
    popd;
}

alias gits='git-sync_'

# grab stuff from the keys file if present
test -r ~/.keys && source ~/.keys

# capslock is useless
setxkbmap -option ctrl:nocaps

# set brightness just on my laptop
if [ $HOSTNAME == "chi100787" ]; then
    xbacklight -set 90
fi
