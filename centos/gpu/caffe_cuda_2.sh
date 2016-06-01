#caffe install on Ubuntu14.04 with GPU 

#Set BIOS start only with UMA
#ctrl+Alt+F1 

sudo init 3

sudo chmod +x cuda_7.5.18_linux.run
sudo ./cuda_7.5.18_linux.run

#CUDA7.5 configure
sudo sh -c 'echo "export PATH=/usr/local/cuda-7.5/bin:\$PATH" >> /etc/profile'

source /etc/profile

sudo sh -c 'echo "/usr/local/cuda-7.5/lib64" > /etc/ld.so.conf.d/cuda.conf'

sudo ldconfig

#then reboot

