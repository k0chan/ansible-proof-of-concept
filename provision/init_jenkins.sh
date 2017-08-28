#!/bin/bash

# ---- ADDITIONAL CONFIGURATION ----
function editHosts {
    declare -A hosts
    hosts=( ["server1"]="192.168.40.22"  )
    for host in "${!hosts[@]}"; do
        if grep -q "${host}" /etc/hosts; then
            echo "${host} exists"
        else
            echo "Added ${hosts[$host]}" "${host}"
            echo "${hosts[$host]}" "${host}" >> /etc/hosts
        fi
    done
}


echo "----------------  Edit /etc/hosts ----------------"
editHosts; printf "\n\n"