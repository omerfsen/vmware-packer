#!/bin/bash

echo "Installing Telegraph"
export DEBIAN_FRONTEND=noninteractive
wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list

sudo apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get -y install telegraf open-vm-tools network-manager

echo "Updating all packages"
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

if [[ -f /etc/rc.local ]] 
then
	echo "Restarting rc-local service so new rc.local takes affect"
	# ls -la /etc/rc.local
	# cat /etc/rc.local
	sudo chmod 755 /etc/rc.local
	sudo chown root:root /etc/rc.local
	sudo systemctl daemon-reload 
	sudo systemctl enable NetworkManager.service
else
	echo "There is no rc.local file in etc dir"
fi
