#!/bin/bash
sudo cp 8723bs.ko /lib/modules/3.10.70/kernel/drivers/net/wireless/
sudo depmod -a
sudo modprobe 8723bs
sudo sed -i -e '$d' /etc/rc.local
sudo sh -c 'echo "modprobe 8723bs\nexit 0" >> /etc/rc.local'
sudo passwd minipc
sudo dpkg-reconfigure tzdata
sudo ibus-setup
