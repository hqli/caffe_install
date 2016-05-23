#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   caffe on CentOS6.5 with GPU 

#use: visudo,将本用户添加root权限
 
# yum install boost-devel与caffe不匹配,缺少-lcblas
tar -jxvf boost_1_59_0.tar.bz2
cd boost_1_59_0
./bootstrap.sh
./b2
sudo ./b2 install
sudo ./b2 --with-python install
cd ..
# boost config
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/boost.conf'
sudo ldconfig


#No package glog-devel available.
# glog
tar zxvf glog-0.3.3.tar.gz
cd glog-0.3.3
./configure
make
sudo make install
cd ..


# cmake>2.8 needed by gflags
tar zxvf cmake-3.5.0.tar.gz
cd cmake-3.5.0
./configure
make
sudo make install
cd ..

# gflags
unzip gflags-master.zip
cd gflags-master
mkdir build && cd build
export CXXFLAGS="-fPIC" && /usr/local/bin/cmake .. && make VERBOSE=1
make
sudo make install
cd ../..
