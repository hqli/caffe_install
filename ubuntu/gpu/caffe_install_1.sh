#caffe install on Ubuntu14.04 with GPU 

#Set BIOS start only with UMA
#ctrl+Alt+F1 

sudo rm /etc/modprobe.d/blacklist-nouveau.conf

sudo echo "blacklist nouveau">>/etc/modprobe.d/blacklist-nouveau.conf
sudo echo "options nouveau modeset=0">>/etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

#then reboot
