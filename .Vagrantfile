# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

IPS = {
    :node1 => '192.168.56.101',
    :node2 => '192.168.56.102',
    :node3 => '192.168.56.103',
}

$script = <<SCRIPT
echo 'nameserver 8.8.8.8' > /etc/resolv.conf
echo 'nameserver 8.8.4.4' >> /etc/resolv.conf
rpm -i http://mirror.sfo12.us.leaseweb.net/epel/6/i386/epel-release-6-8.noarch.rpm
yum install -y omping
logger 'Provisioning complete.'
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    %w{node1 node2 node3}.each do |hostname|
        config.vm.define hostname do |node|
          node.vm.hostname = hostname
          node.vm.network "private_network", ip: IPS[hostname.to_sym]
          node.vm.box = "centos64"
          node.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box"
          node.vm.provision "shell", inline: $script
        end
    end
end
