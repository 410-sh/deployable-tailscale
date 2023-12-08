#!/bin/sh
if ! command -v tailscale &> /dev/null
then
        curl -fsSL https://tailscale.com/install.sh | sh
fi
sudo tailscale up --authkey=[YOUR_AUTH_KEY_HERE]
