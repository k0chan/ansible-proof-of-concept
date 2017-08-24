#!/bin/bash

# Methods
checkAnsible() {
    ansible --version &>/dev/null
    return $?
}

# General configuration
apt-get update
apt-get install -y git vim telnet

# Check if ansible is installed
checkAnsible
if [[ "$(echo $?)" != 0 ]]; then
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    apt-get update
    apt-get install -y ansible
fi

# Change permission for private key to remote machine
chmod 600 /home/vagrant/.ssh/id_rsa
