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

function external()
{
    usage="external on|off"
    if [ -z "$1" ]; then
        echo $usage
        return
    fi

    if [ "on" == "$1" ]; then
        export PRE_EXTERNAL_PS1=$PS1
	export PS1="\[\033[0;31m\]===EXTERNAL DEBESYS===\n$PRE_EXTERNAL_PS1"
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
    elif [ "off" == "$1" ]; then
        if [ ! -z "$PRE_EXTERNAL_PS1" ]; then
            export PS1=$PRE_EXTERNAL_PS1
        fi
        alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
        alias ttknife
    else
        echo $usage
    fi
}

function vpn {
    sudo /home/jason/.juniper_networks/ncsvc -h us-ttvpn.tradingtechnologies.com -u jerdmann -p $1 -r "TT VPN" -f /home/jason/.juniper_networks/tt.cert
}

function grabview {
    scp 119.0.200.55:/opt/splunk/etc/apps/ttnet_operations/local/data/ui/views/$1 ~/ttnet/monitoring/splunk/deployment-apps/ttnet_operations/local/data/ui/views/
}

function grabnav {
    scp 119.0.200.55:/opt/splunk/etc/apps/ttnet_operations/local/data/ui/nav/default.xml ~/ttnet/monitoring/splunk/deployment-apps/ttnet_operations/local/data/ui/nav/
}

# function for showing all Icinga hosts that have a service state matching the arg passed
function geticinga {
    curl -u jerdmann -k "https://icinga/icinga/cgi-bin/status.cgi?host=all&type=detail&csvoutput" | grep "$1" | cut -f1 -d\; | sed "s/'//g" | sort -u
}

