#!/bin/bash

set -x

apt update
apt install -y openssh-server neovim less unzip wget curl zstd git aria2 tmux libgl1 libglib2.0-0
apt clean
rm -rf /var/lib/apt/lists/*

wget "https://dl.min.io/client/mc/release/linux-amd64/mc"
chmod +x mc
mv mc /usr/local/bin

wget "https://caddyserver.com/api/download?os=linux&arch=amd64&idempotency=47411853371813" -O caddy
chmod +x caddy
mv caddy /usr/local/bin

wget "https://github.com/svenstaro/miniserve/releases/download/v0.22.0/miniserve-0.22.0-x86_64-unknown-linux-musl" -O miniserve
chmod +x miniserve
mv miniserve /usr/local/bin

wget "https://github.com/cloudflare/cloudflared/releases/download/2022.10.0/cloudflared-linux-amd64" -O cloudflared
chmod +x cloudflared
mv cloudflared /usr/local/bin

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
