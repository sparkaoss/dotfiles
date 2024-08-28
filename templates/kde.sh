#!/bin/bash

#sudo reflector -c Switzerland -a 6 --sort rate --save /etc/pacman.d/mirrorlist

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq


sudo pacman -S --noconfirm --asdeps --needed plasma sddm sddm-kcm system-config-printer power-profiles-daemon kdialog konsole okular vlc gwenview spectacle dolphin dolphin-plugins kdeplasma-addons ark unzip unrar hunspell-es_any kdeconnect 

sudo systemctl enable sddm.service