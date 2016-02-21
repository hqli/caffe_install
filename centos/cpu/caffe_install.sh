#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   just for CPU, no CUDA, matlab and python interface

#use: visudo,将本用户添加root权限

sudo rm -rf ~/caffe-master

#使用EPEL的库，否则一些软件包找不到
#rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-9.noarch.rpm
sudo yum install -y epel-release
sudo yum clean all
sudo yum makecache

#gcc与g++
sudo yum install -y  gcc
sudo yum install -y  gcc-c++ 

sudo yum install -y freeglut

#General dependencies
sudo yum install -y protobuf-devel leveldb-devel snappy-devel opencv-devel  hdf5-devel

#yum install boost-devel与caffe不匹配,缺少-lcblas
tar -jxvf boost_1_59_0.tar.bz2
cd boost_1_59_0
./bootstrap.sh
./b2
sudo ./b2 install
sudo echo "/usr/local/lib" >> /etc/ld.so.conf
sudo ldconfig
cd ..

#Remaining dependencies, recent OS
sudo yum install -y gflags-devel glog-devel lmdb-devel
#No package glog-devel available.
# glog
wget https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz
tar zxvf glog-0.3.3.tar.gz
cd glog-0.3.3
./configure
make
sudo make install
cd ..

#BLAS
#sudo yum install -y atlas-devel
#使用atlas，问题：cannot find -lcblas

#使用mkl
#You will complete the steps below during this installation:
#Step 1 : Welcome
#Step 2 : License agreement
#Step 3 : Activation
#Step 4 : Intel(R) Software Improvement Program
#Step 5 : Options
#Step 6 : Installation
#Step 7 : Complete

#SKCG-8K8GKX84



#安装opencv

#准备
sudo yum -y groupinstall "Development Tools"
sudo yum -y install wget unzip opencv opencv-devel gtk2-devel cmake

unzip opencv-2.4.9.zip
cd opencv-2.4.9

sed  -i '/string(MD5/d' cmake/cl2cpp.cmake
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j 4
sudo make install
cd ../..


#opencv
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
#mkl
sudo sh -c 'echo "/opt/intel/lib/intel64" > /etc/ld.so.conf.d/mkl.conf'
sudo sh -c 'echo "/opt/intel/mkl/lib/intel64" >> /etc/ld.so.conf.d/mkl.conf'
#更新运行时库
sudo ldconfig
cd ../..

#install caffe on ~
cd ~

sudo apt-get install -y wget unzip
wget https://github.com/BVLC/caffe/archive/master.zip
unzip master.zip
rm master.zip

cd ~/caffe-master

cp Makefile.config.example Makefile.config
echo "CPU_ONLY := 1">>Makefile.config
sed -i "s/BLAS := atlas/BLAS := mkl/g" Makefile.config

#make all -j4
make all
