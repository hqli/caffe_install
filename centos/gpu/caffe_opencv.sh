#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   caffe on CentOS6.5 with GPU 


# opencv

unzip opencv-2.4.9.zip
cd opencv-2.4.9
# opencv config
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

cmake --version | grep " 2.6"
if [ $? -eq 0 ]; then
    # Delete lines beginning with string(MD5 based on incompatibility with cmake 2.6.  See 
    # http://answers.opencv.org/question/24095/building-opencv-247-on-centos-6/
    sed  -i '/string(MD5/d' cmake/cl2cpp.cmake
fi
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local  ..
make -j 4
sudo make install
cd ../..
