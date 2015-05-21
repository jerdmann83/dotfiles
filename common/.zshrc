# Path to your oh-my-zsh installation.
export ZSH=/home/jason/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jason"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(themes)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
export EDITOR='vim'
export TERM=xterm-256color

alias vcloud='~/debesys-scripts/run ~/debesys-scripts/deploy/chef/scripts/vcloud_server.py'
alias bump='~/debesys-scripts/run python ~/debesys-scripts/deploy/chef/scripts/bump_cookbook_version.py'
alias deploy='~/debesys-scripts/run python ~/debesys-scripts/deploy/chef/scripts/request_deploy.py'
alias deb='cd $(pwd | grep dev-root | cut -f1-5 -d\/) || echo "Not in a repo under dev-root."'
alias debone='cd ~/dev-root/debesys-one'
alias debtwo='cd ~/dev-root/debesys-two'
alias debthree='cd ~/dev-root/debesys-three'
alias debs='cd ~/debesys-scripts'
alias dev='cd ~/dev-root'
alias dot='cd ~/.dotfiles'
alias gvim='gvim --remote-silent'
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

alias tnew='tmux new-session -s '
alias tattach='tmux attach-session -t '
alias tkill='tmux kill-session -t '
alias tlist='tmux list-session'

# debesys stuff
alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
alias run='`git rev-parse --show-toplevel`/run'

# vcd stuff
export INTAD_USER=jerdmann
export VCD_ORG=Dev_General

export AWS_DEFAULT_REGION='us-east-1'
export JENKINS_USER='jason.erdmann@tradingtechnologies.com'

# ttnet project dirs
alias cdspl='cd ~/ttnet/monitoring/splunk'
alias cdici='cd ~/ttnet/monitoring/icinga'
alias cdds='cd ~/ttnet/monitoring/scripts/centosDs'
alias debone='cd ~/dev-root/debesys-one'
alias debtwo='cd ~/dev-root/debesys-two'
alias debthree='cd ~/dev-root/debesys-three'
alias cb='cd `git rev-parse --show-toplevel`/deploy/chef/cookbooks'

if [[ -f ~/.keys ]]; then
    . ~/.keys
fi

# capslock is useless
setxkbmap -option ctrl:nocaps 2>/dev/null

# set brightness
xbacklight -set 90 2>/dev/null || cat /dev/null

# some function definitions
function vpn {
    sudo /home/jason/.juniper_networks/ncsvc -h us-ttvpn.tradingtechnologies.com -u jerdmann -p $1 -r "TT VPN" -f /home/jason/.juniper_networks/tt.cert
}

function external()
{
    usage="external on|off"
    if [[ -z "$1" ]]; then
        echo $usage
        return
    fi

    if [[ "on" == "$1" ]]; then
        export PRE_EXTERNAL_PS1=$PS1
        export PS1="%{$fg[red]%}[EXTERNAL DEBESYS] $PRE_EXTERNAL_PS1"
        alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife -C ~/.chef/knife.external.rb'
        alias ttknife
        echo
        echo '######## ##     ## ######## ######## ########  ##    ##    ###    ##'
        echo '##        ##   ##     ##    ##       ##     ## ###   ##   ## ##   ##'
        echo '##         ## ##      ##    ##       ##     ## ####  ##  ##   ##  ##'
        echo '######      ###       ##    ######   ########  ## ## ## ##     ## ##'
        echo '##         ## ##      ##    ##       ##   ##   ##  #### ######### ##'
        echo '##        ##   ##     ##    ##       ##    ##  ##   ### ##     ## ##'
        echo '######## ##     ##    ##    ######## ##     ## ##    ## ##     ## ########'
        echo
        # http://patorjk.com/software/taag/#p=display&h=1&v=1&f=Banner3&t=EXTERNAL
    elif [[ "off" == "$1" ]]; then
        if [[ ! -z "$PRE_EXTERNAL_PS1" ]]; then
            export PS1=$PRE_EXTERNAL_PS1
        fi
        alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
        alias ttknife
    else
        echo $usage
    fi
}
