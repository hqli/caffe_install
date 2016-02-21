#caffe install on Ubuntu14.04 with GPU 
#no python and matlab interface

#Set BIOS start only with UMA
#ctrl+Alt+F1 

sudo rm /etc/modprobe.d/blacklist-nouveau.conf

sudo echo "blacklist nouveau">>/etc/modprobe.d/blacklist-nouveau.conf
sudo echo "options nouveau modeset=0">>/etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u
sudo stop lightdm
sudo init 3
sudo chmod +x cuda_7.5.18_linux.run
sudo ./cuda_7.5.18_linux.run

#then reboot

