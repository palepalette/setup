#!/bin/sh

wget http://www.sbrac.org/files/build-gnuradio
chmod a+x build-gnuradio
yes | ./build-gnuradio
sudo /usr/local/lib/uhd/utils/uhd_images_downloader.py
#/usr/local/lib/uhd/utils/usrp_n2xx_simple_net_burner
