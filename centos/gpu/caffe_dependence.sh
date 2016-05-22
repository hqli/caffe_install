#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   caffe on CentOS6.5 with GPU 

#use: visudo,将本用户添加root权限


#使用EPEL的库，否则一些软件包找不到
#rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-9.noarch.rpm
sudo yum install -y epel-release
sudo yum clean all
sudo yum makecache


#CUDA7.5 configure
sudo echo "export PATH=/usr/local/cuda-7.5/bin:\$PATH">>/etc/profile
source /etc/profile
sudo rm /etc/ld.so.conf.d/cuda.conf
sudo echo "/usr/local/cuda-7.5/lib64">>/etc/ld.so.conf.d/cuda.conf
#更新运行时库
sudo ldconfig

# mkl config
sudo sh -c 'echo "/opt/intel/lib/intel64" > /etc/ld.so.conf.d/mkl.conf'
sudo sh -c 'echo "/opt/intel/mkl/lib/intel64" >> /etc/ld.so.conf.d/mkl.conf'
sudo ldconfig

#gcc与g++
sudo yum install -y  gcc
sudo yum install -y  gcc-c++ 

sudo yum install -y freeglut

#General dependencies
sudo yum install -y protobuf-devel leveldb-devel snappy-devel opencv-devel  hdf5-devel

# boost 
# yum install boost-devel与caffe不匹配,缺少-lcblas
tar -jxvf boost_1_59_0.tar.bz2
cd boost_1_59_0
./bootstrap.sh
./b2
sudo ./b2 install
sudo ./b2 --with-python install
cd ..
# boost config
sudo echo "/usr/local/lib" >> /etc/ld.so.conf.d/boost.conf
sudo ldconfig

#Remaining dependencies, recent OS
sudo yum install -y gflags-devel glog-devel lmdb-devel
#No package glog-devel available.
# glog
tar zxvf glog-0.3.3.tar.gz
cd glog-0.3.3
./configure
make
sudo make install
cd ..

#安装opencv

#准备
sudo yum -y groupinstall "Development Tools"
sudo yum -y install wget unzip opencv opencv-devel gtk2-devel cmake
sudo yum -y install ant.x86_64 gcc.x86_64 gcc-c++.x86_64 cmake.x86_64 git.x86_64 pkgconfig.x86_64 gtk2.x86_64 gtk2-devel.x86_64 libdc1394.x86_64 libdc1394-devel.x86_64 libjpeg-turbo.x86_64 libjpeg-turbo-devel.x86_64 libpng.x86_64 libpng-devel.x86_64 libtiff.x86_64 libtiff-devel.x86_64 jasper.x86_64 jasper-libs.x86_64 jasper-devel.x86_64 yasm.x86_64 yasm-devel.x86_64

unzip opencv-2.4.9.zip
cd opencv-2.4.9
# opencv config
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

sed  -i '/string(MD5/d' cmake/cl2cpp.cmake
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA ..
make -j 4
sudo make install
cd ../..


# cmake>2.8 needed by gflags
tar zxvf cmake-3.5.0.tar.gz
cd cmake-3.5.0
./configure
make
sudo make install
cd ..

# gflags
unzip gflags-master.zip
mkdir build && cd build
export CXXFLAGS="-fPIC" && /usr/local/bin/cmake3.5 .. && make VERBOSE=1
make
sudo make install
cd ../..

# boost config

