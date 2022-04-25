#!/bin/sh
curl ifconfig.me
sudo apt-get update
sudo apt-get install apt-transport-https

wget -qO - "https://repo.nordvpn.com/gpg/nordvpn_public.asc" | sudo tee /etc/apt/trusted.gpg.d/nordvpn_public.asc > /dev/null

echo "deb https://repo.nordvpn.com/deb/nordvpn/debian stable main" | sudo tee /etc/apt/sources.list.d/nordvpn.list
sudo apt-get update
sudo apt-get install nordvpn

nordvpn login
nordvpn set killswitch on
nordvpn set dns 9.9.9.9
nordvpn set technology nordlynx
nordvpn connect DE -g double_vpn
curl ifconfig.me
