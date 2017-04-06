#!/bin/bash

echo -n "Desligando a interface wlan0... "
ifconfig wlan0 down
echo -e "\033[0;32m OK \033[0m "

echo -n "Configurando ad-hoc... "
iwconfig wlan0 essid h2k mode Ad-Hoc channel 11 key restricted 53445678AF
echo -e "\033[0;32m OK \033[0m "

echo -n "Subindo a interface wlan0... "
ifconfig wlan0 192.168.0.1 netmask 255.255.255.0 up
echo -e "\033[0;32m OK \033[0m "

echo -n "Verificando o servidor DHCP... "
killall dhcpd 2> /dev/null
dhcpd wlan0 2> /dev/null
echo -e "\033[0;32m OK \033[0m "
echo "Rede ad-hoc configurada..."
