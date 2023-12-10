#!/bin/bash

# Funciones de códigos de color para echo

ROJO="\033[1;31m"
NORMAL="\033[0m"
AZUL="\033[1;34m"

# Actualiza los repositorios

echo -e "${ROJO}Updating repos - Actualizando repositorios${NORMAL}"
cd /home/$USER
sudo rm /etc/apt/sources.list
wget https://raw.githubusercontent.com/aosucas499/sources/main/raspbian-buster-sources.list -O sources.list
sudo mv sources.list /etc/apt
sudo rm /etc/apt/sources.list.d/raspi.list 
 
# Instalando paquetes necesarios para pidvbip

echo -e "${ROJO}Installing necessary packages for pidvbip - Instalando paquetes necesarios para pidvbip${NORMAL}"
sudo apt-get update -y
sudo apt-get install -y git libmpg123-dev libfaad-dev liba52-dev libavahi-client-dev libfreetype6-dev libavformat-dev ir-keytable

# Descarga pidvbip

echo -e "${ROJO}Donwloading and installing dvbip - Descargando e instalando dvbip${NORMAL}"
git clone https://github.com/aosucas499/pidvbip
cd pidvbip
./configure && make

# Copiar los servicios

echo -e "${ROJO}Copying services to load pidvbip at boot - Copiando servicios para cargar pidvb al inicio${NORMAL}"
sudo cp pidvbip.service /etc/systemd/system

# Recarga los servicios del sistema
sudo systemctl daemon-reload

# Inicia los servicios
sudo systemctl enable pidvbip.service
#sudo systemctl start pidvbip.service

echo -e "${ROJO}Don't forget to buy your license mpeg2 for your raspberry, or it won't work - No olvide comprar su licencia mpeg2 para su raspberry, o no funcionará${NORMAL}"
echo -e "${AZUL}$More info in the github link of this project - Más información en el enlace github de este proyecto{NORMAL}"
