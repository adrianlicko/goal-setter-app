#!/bin/bash

# Získajte novú IP adresu od používateľa
echo "Zadajte novú IP adresu:"
read ip_address

# Získajte novú masku podsiete od používateľa
echo "Zadajte novú masku podsiete:"
read netmask

# Predpokladáme, že sieťové rozhranie je eth0. Ak máte iné rozhranie, zmeňte to tu.
network_interface="eth0"

# Vytvorte konfiguračný súbor pre netplan
echo "network:
  version: 2
  renderer: networkd
  ethernets:
    $network_interface:
      dhcp4: no
      addresses: [$ip_address/$netmask]" | sudo tee /etc/netplan/01-netcfg.yaml > /dev/null

# Aplikujte novú konfiguráciu
sudo netplan apply

echo "IP adresa a maska podsiete boli úspešne zmenené."
