#caffe install on Ubuntu14.04
#author：李华清 
#just for CPU
#no CUDA matlab interface

#please updata Software Source before install 

#install General dependencies
sudo apt-get build-essential
sudo apt-get  install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install -y --no-install-recommends libboost-all-dev
#install blas
sudo apt-get install -y libatlas-base-dev
#Remaining dependencies
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev
sudo apt-get install -y wget unzip

