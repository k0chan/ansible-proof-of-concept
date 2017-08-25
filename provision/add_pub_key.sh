#!/bin/bash

# variables
pathToAuthorizedKeys="/home/vagrant/.ssh/authorized_keys"

[[ -n "$1" ]] && pubKey="${1}" || { echoRed "Require path to public key"; exit 1; }
commendInKey=$( echo ${pubKey##* } )

if grep -q "${commendInKey}" "${pathToAuthorizedKeys}"; then
    echo "${commendInKey} key exists"
else
    echo "Added key to ${pathToAuthorizedKeys}"
    echo "${pubKey}" >> /home/vagrant/.ssh/authorized_keys
fi