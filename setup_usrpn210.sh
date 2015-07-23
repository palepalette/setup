#!/bin/sh

sudo ifconfig eth0 down
sudo ifconfig eth0 up
sudo ifconfig eth0 192.168.10.1

sleep 5 

sudo sysctl -w net.core.rmem_max=50000000
sudo sysctl -w net.core.wmem_max=1048576
uhd_usrp_probe | grep mac | awk -F" " '{print $4}' > usrp_address.txt
sudo uhd_find_devices
