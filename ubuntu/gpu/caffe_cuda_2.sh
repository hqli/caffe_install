#caffe install on Ubuntu14.04 with GPU 

#Set BIOS start only with UMA
#ctrl+Alt+F1 

sudo stop lightdm
sudo init 3
sudo chmod +x cuda_7.5.18_linux.run
sudo ./cuda_7.5.18_linux.run
#then reboot

