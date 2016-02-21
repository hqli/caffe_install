#caffe install on Ubuntu14.04 with GPU 

sudo sed -i "/PATH=\/usr\/local\/cuda-7.5\/bin:\$PATH/d" /etc/profile
sudo sed -i "/export PATH/d" /etc/profile
sudo rm /etc/ld.so.conf.d/cuda.conf

#CUDA7.5 configure
sudo echo "PATH=/usr/local/cuda-7.5/bin:\$PATH">>/etc/profile
sudo echo "export PATH">>/etc/profile
source /etc/profile
sudo echo "/usr/local/cuda-7.5/lib64">>/etc/ld.so.conf.d/cuda.conf
sudo ldconfig

#
sudo apt-get build-essential
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install -y --no-install-recommends libboost-all-dev
#install -y blas
sudo apt-get install -y libatlas-base-dev
#Remaining dependencies
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev
#install -y caffe on ~
cd ~

sudo apt-get install -y wget unzip
wget https://github.com/BVLC/caffe/archive/master.zip

unzip master.zip
rm master.zip

cd caffe-master

cp Makefile.config.example Makefile.config
make all
