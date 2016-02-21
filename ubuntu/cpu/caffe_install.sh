#caffe install on Ubuntu14.04
#author：李华清 
#just for CPU
#no CUDA matlab interface

#please updata Software Source before install 

sudo rm -rf ~/caffe-master

#install General dependencies
sudo apt-get build-essential
sudo apt-get  install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install -y --no-install-recommends libboost-all-dev
#install blas
sudo apt-get install -y libatlas-base-dev
#Remaining dependencies
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev


#install caffe on ~

cd ~

sudo apt-get install -y wget unzip
wget https://github.com/BVLC/caffe/archive/master.zip
unzip master.zip
rm master.zip

cd caffe-master

cp Makefile.config.example Makefile.config
echo "CPU_ONLY := 1">>Makefile.config
make all
