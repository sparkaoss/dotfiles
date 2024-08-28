#!/bin/zsh

archivo1="/usr/share/alsa-card-profile/mixer/paths/analog-output-headphones.conf"
archivo2="/usr/share/alsa-card-profile/mixer/paths/analog-output-headphones-2.conf"

# Verificar si los archivos existen
if [ ! -f "$archivo1" ] || [ ! -f "$archivo2" ]; then
    echo "Uno o ambos archivos no existen."
    exit 1
fi

# Realizar cambios en el primer archivo
sed -i -E '/\[Element Speaker\]/,/^\[/ s/volume = off/volume = merge/' "$archivo1"

# Realizar cambios en el segundo archivo
sed -i -E '/\[Element Speaker\]/,/^\[/ s/volume = off/volume = merge/' "$archivo2"

echo "Se han realizado los cambios en ambos archivos."