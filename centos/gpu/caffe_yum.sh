# caffe's dependence installed by yum

# epel
sudo yum install -y epel-release
sudo yum clean all
sudo yum makecache

#gcc与g++
sudo yum install -y  gcc gcc-c++ freeglut

# cuda
sudo yum install kernel-devel kernel-headers

# mkl intel
sudo yum install -y xulrunner.i686

#opencv
sudo yum -y groupinstall "Development Tools"
sudo yum -y install wget unzip opencv opencv-devel gtk2-devel cmake
sudo yum -y install ant.x86_64 gcc.x86_64 gcc-c++.x86_64 cmake.x86_64 git.x86_64 pkgconfig.x86_64 gtk2.x86_64 gtk2-devel.x86_64 libdc1394.x86_64 libdc1394-devel.x86_64 libjpeg-turbo.x86_64 libjpeg-turbo-devel.x86_64 libpng.x86_64 libpng-devel.x86_64 libtiff.x86_64 libtiff-devel.x86_64 jasper.x86_64 jasper-libs.x86_64 jasper-devel.x86_64 yasm.x86_64 yasm-devel.x86_64


#caffe General dependencies
sudo yum install -y protobuf-devel leveldb-devel snappy-devel opencv-devel  hdf5-devel

#Remaining dependencies, recent OS
sudo yum install -y gflags-devel glog-devel lmdb-devel

# python
sudo yum install -y python-devel python-pip

# blas with ablas (recommand mkl)
# yum -y install blas blas-devel atlas atlas-devel atlas-sse3 atlas-sse3-devel lapack lapack-devel
