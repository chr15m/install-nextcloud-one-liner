#!/bin/sh

# This script is based on the Digital Ocean tutorials:
# https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-nextcloud-on-ubuntu-20-04

# bail on any error
set -e

if [ "$3" = "" ]
then
  ip=`dig @resolver4.opendns.com myip.opendns.com +short`
  echo "Usage: ./install-nextcloud.sh HOSTNAME USERNAME PASSWORD"
  echo
  echo "This script should be run on an Ubuntu Linux VPS."
  echo "HOSTNAME is a valid domain name which is already pointing at this box."
  echo "USERNAME is the username you want for the first account (and admin)."
  echo "PASSWORD is the password you want for that user."
  echo
  echo "Your IP is $ip."
  echo "If you do not have a domain name you can use an IP domain proxy like this:"
  echo "$ip.traefik.me"
  echo "$ip.nip.io"
  echo "$ip.sslip.io"
  exit 1
fi

echo "WARNING: This script will make adjustments to this machine."
echo "         It installs nextcloud, adjusts the firewall, and creates swap."
echo "         Please run it on a fresh Ubuntu VPS."
echo
echo "If you do not want this, press ctrl-C within 3 seconds."

sleep 3

### Update the box

apt update
apt upgrade -y

### Create a swapfile

# how much memory does this box have?
mem=`awk '/MemTotal/ {print $2}' /proc/meminfo`
dd if=/dev/zero of=/swapfile bs=1024 count=$mem
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile    none    swap    sw    0    0" >> /etc/fstab

### Get the nextcloud snap installed

snap install nextcloud
nextcloud.manual-install $2 $3
nextcloud.occ config:system:set trusted_domains 1 --value=$1

### Open firewall ports

ufw allow OpenSSH
ufw allow 80,443/tcp
ufw enable

### Get an SSL certificate

nextcloud.enable-https lets-encrypt

### Done

echo
echo
echo "Nextcloud is now installed. You can find it here:"
echo "https://$1"
echo
echo "If you want to say thanks you can find me here:"
echo 
echo "https://mccormick.cx"
echo "https://twitter.com/mccrmx"
echo
echo "Enjoy your Nextcloud box."

