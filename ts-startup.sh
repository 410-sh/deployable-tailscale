#!/bin/sh
if ! command -v tailscale &> /dev/null
then
        curl -fsSL https://tailscale.com/install.sh | sh
fi
# uncomment the following line if using Tailscale's server
# sudo tailscale up --authkey=[YOUR_AUTH_KEY_HERE]

# uncomment the following line if using a Headscale server
# sudo tailscale up --login-server http://{SERVER-ADDR}:{PORT} --authkey=[YOUR_AUTH_KEY_HERE]
