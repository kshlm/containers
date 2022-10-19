#!/bin/bash
echo "Container Started"
source "$HOME/.bashrc"

mkdir -p /workspace/{cache,micromamba}

if [[ $PUBLIC_KEY ]]
then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    pushd ~/.ssh
    echo "$PUBLIC_KEY" >> authorized_keys
    chmod 700 -R ~/.ssh
    popd
    cd /
    service ssh start
    echo "SSH Service Started"
fi

sleep infinity
