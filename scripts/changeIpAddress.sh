#!/bin/bash

echo "Zadajte novú IP adresu:"
read new_ip

echo "Zadajte novú sieťovú masku (napr., 24):"
read netmask

# Zálohovanie pôvodného konfiguračného súboru netplan
sudo cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak

# Zápis novej IP konfigurácie do konfiguračného súboru netplan
echo "network:
  ethernets:
    enp0s3:
      addresses:
        - $new_ip/$netmask
      nameservers:
          addresses: [8.8.8.8]
  version: 2" | sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null

# Použitie novej konfigurácie netplan
sudo netplan apply

echo "IP adresa bola úspešne zmenená."
