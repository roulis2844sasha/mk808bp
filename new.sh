#!/bin/bash

if [ $1 == 'dev' ]; then
	echo 'Enable devel mode'
	sudo modprobe loop
	loop=`sudo losetup -f`
	sudo losetup $loop $2
	sudo partprobe $loop
	sudo gparted $loop
	sudo losetup -d $loop
	fdisk -l $2
	echo 'End image'
	read end
	truncate --size=$[($end+1)*512] $2
else
	echo 'Install'
fi
