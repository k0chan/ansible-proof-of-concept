#!/bin/bash

pathToAuthorizedKeys="/home/vagrant/.ssh/authorized_keys"

for pubKey in "$@"; do
    commendInKey=$( echo ${pubKey##* } )

    if grep -q "${commendInKey}" "${pathToAuthorizedKeys}"; then
        echo "${commendInKey} key exists"
    else
        echo "Added key to ${pathToAuthorizedKeys}"
        echo "${pubKey}" >> /home/vagrant/.ssh/authorized_keys
    fi
done