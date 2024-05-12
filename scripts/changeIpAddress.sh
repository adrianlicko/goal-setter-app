#!/bin/bash

echo "Chcete nastavit IP adresu staticky alebo dynamicky? (s/d)"
read choice

if [ "$choice" = "s" ]; then
    echo "Zadajte novú IP adresu:"
    read new_ip

    echo "Zadajte novú sieťovú masku (napr., 24):"
    read netmask

    sudo cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak

    echo "network:
      ethernets:
        enp0s3:
          addresses:
            - $new_ip/$netmask
          nameservers:
              addresses: [8.8.8.8]
      version: 2" | sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null

    sudo netplan apply

    echo "IP adresa bola úspešne zmenená na statickú."
else
    sudo cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak

    echo "network:
      ethernets:
        enp0s3:
          dhcp4: true
      version: 2" | sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null

    sudo netplan apply

    echo "IP adresa bola úspešne zmenená na dynamickú."
fi
