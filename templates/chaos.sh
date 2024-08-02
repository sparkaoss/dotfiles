#!/bin/bash

# Run the script with sudo
if [ "$(id -u)" != "0" ]; then
    echo "Este script debe ejecutarse con privilegios de superusuario (sudo)"
    exit 1
fi

echo "Adding the keys of Chaotic aur..."
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB

echo "Installing chaotic-keyring..."
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "Adding repository and mirrorlist."
echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

echo "Saving changes to the file..."

echo "Updating system repositories..."
pacman -Syu