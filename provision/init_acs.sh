#!/bin/bash

# ---- INSTALL EXTRA PACKAGES ----
function installPackage {
    extra_package=(git telnet vim)

    for package in "${extra_package[@]}"; do
      if dpkg -s "${package}" &>/dev/null; then
        echo "Package ${package} exists"
      else
        echo "Installing ${package}"
        apt-get install -y "${package}"
      fi
    done
}

function installAnsible {
    if ! ansible --version &>/dev/null; then
        echo "Installing Ansible"
        echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
        apt-get update
        apt-get install -y ansible
    else
        echo "Ansible is already installed"
    fi
}


# ---- ADDITIONAL CONFIGURATION ----
function editHosts {
    declare -A hosts
    hosts=( ["server1"]="192.168.40.21" )
    for host in "${!hosts[@]}"; do
        if grep -q "${host}" /etc/hosts; then
            echo "${host} exists"
        else
            echo "Modifies /etc/hosts"
            echo "${hosts[$host]}" "${host}" >> /etc/hosts
        fi
    done
}

function setPropertyPermissions {
    local pathToPrivateKey="/home/vagrant/.ssh/id_rsa"
    chmod 600 "${pathToPrivateKey}"
    echo "Permission to file ${pathToPrivateKey} is already settled"
}


# General configuration
echo "----------------  Install Packages ----------------"
installPackage; printf "\n\n"


# Check if ansible is installed
echo "----------------  Install Ansible ----------------"
installAnsible; printf "\n\n"


# Add domain to /etc/hosts
echo "----------------  Edit /etc/hosts ----------------"
editHosts; printf "\n\n"


# Change permission for private key to remote machine
echo "----------------  Set Property Permission to file ----------------"
setPropertyPermissions; printf "\n\n"

