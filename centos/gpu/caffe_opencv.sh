#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   caffe on CentOS6.5 with GPU 


# opencv

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
