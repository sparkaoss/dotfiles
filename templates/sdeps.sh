#!/bin/bash

sudo pacman -S --asdeps --needed xorg xf86-video-intel intel-ucode nvidia nvidia-utils nvidia-settings nvidia-prime envycontrol auto-cpufreq thermald python-pyqt6 firewalld sof-firmware alsa-firmware alsa-utils alsa-tools jamesdsp fastfetch zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting starship htop btop powertop gvfs mtpfs sshfs
sudo pacman -S --needed noto-fonts-emoji noto-fonts-cjk ttf-joypixels ttf-hack-nerd ttf-ms-fonts ttf-roboto ttf-twemoji ttf-liberation ttf-ubuntu-font-family ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

sudo systemctl enable auto-cpufreq
sudo systemctl enable thermald


--/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
--sleep 5
--reboot
