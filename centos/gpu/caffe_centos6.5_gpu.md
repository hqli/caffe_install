<markdown>

# caffe安装文档
 
caffe所依赖的环境变量都是用户级的，不是系统级的。  
即PATH与LD_LIBRARY_PATH都放在.bashrc中，没有放在/etc/profile和/etc/ld.conf.d中。

##caffe配置环境脚本与安装脚本
前提已经安装GPU驱动， cuda(7.5)， anconda(安装到/opt/anaconda), MKL, MATLAB(R2014a)    
[caffe_install_env.sh](http://192.168.1.240/caffe/caffe_install/caffe_install_env.sh)    
[caffe_usage.sh](http://192.168.1.240/caffe/caffe_usage.sh)    

## 系统

RHEL6.5     
Ubuntu14.04的CPU版本和GPU版本，Centos6.7的CPU版本，请点击[这里](http://192.168.1.98/caffe/caffe_install/)   
**推荐**使用**Ubuntu14.04**，内网软件源已经搭建，软件源请看左侧边栏

## 主要问题

1. python依赖的安装
  - 使用pip2pi打包，然后建立内网网页服务器，修改客户端的pip.conf
2. 安装新版本的caffe后出现tools/caffe.cpp: In function ‘int main(int, char**)’:tools/caffe.cpp:394: 错误：‘’不是‘gflags’的成员
  - 这是由于caffe新版本/toots/caffe.cpp在394行增加了gflags的SetVersionString这一行，以前的gflags版本没有。
    - 1. 一种方法是注释掉。
    - 2.【选用】第二种方法是手动编译gflags。[要先手动安装glog,然后安装gflags]
3. cudnn不支持计算能力低于3.0的GPU，而C2075的计算能力是2.1.在caffe的Makefile.config不启用cudnn。
4. pydot的问题，应该用/opt/anaconda/bin/pip先卸载pydot，然后安装pydot2
5. 等等问题 


## Caffe依赖

- CUDA：7.5
- BLAS：MKL-parallel_studio_xe_2015_update3
- Boost：1.5.9
- probobuf，glog-0.3.3，gflags-master，hdf5
- Opencv：2.4.9
- IO libraries：lmdb-mdb，leveldb-1.18
- Python：Anaconda-2.2.0
- Matlab：2014a


## 安装

1. GPU驱动和CUDA安装
  - 在配置文件中禁用nouveau
    - vi /etc/modprobe.d/blacklist.conf 添加：blacklist nouveau
      - CentOS 7
        - vim /usr/lib/modprobe.d/dist-blacklist.conf或者vim /lib/modprobe.d/dist-blacklist.conf
        - 并且在加上blacklist nouveau之后还要加上一行options nouveau modeset=0
  - 备份原来的 initramfs nouveau image镜像
    - mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img 
  - 创建新的 initramfs image镜像
    - dracut /boot/initramfs-$(uname -r).img $(uname -r)
  - 所有安装已经完成，重新启动机器
  -  指定kernel-source
    - sudo yum install kernel-devel kernel-headers
  - 关闭图像界面
    - sudo init 3
  - 安装
    - sudo ./NVIDIA-XXXX.run
    - 如果不可以，则使用下面命令sudo ./NVIDIA-XXXX.run --kernel-source-path=/usr/src/kernels/内核号  -k $(uname -r)
2. 基本库
  ```
  yum install gcc gcc-c++  freeglut
  yum -y groupinstall "Development Tools"
  ```

3. 手动安装opencv2.4.9
  - 安装依赖库
    ```
    yum -y install opencv opencv-devel
    yum -y install ant.x86_64 gcc.x86_64 gcc-c++.x86_64 cmake.x86_64 git.x86_64 pkgconfig.x86_64 gtk2.x86_64 gtk2-devel.x86_64 libdc1394.x86_64 libdc1394-devel.x86_64 libjpeg-turbo.x86_64 libjpeg-turbo-devel.x86_64 libpng.x86_64 libpng-devel.x86_64 libtiff.x86_64 libtiff-devel.x86_64 jasper.x86_64 jasper-libs.x86_64 jasper-devel.x86_64 yasm.x86_64 yasm-devel.x86_64
    ```
  - 编译opencv
    - 下载opencv2.4.9和可能用到的NCVPixelOperations.hpp
    ```
    cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
    make -j 8
    ```
  - 安装opencv
     - `sudo make install`

4. 手动安装boost1.59.0
  - 安装boost基本的
    - ./bootstrap.sh
    - ./b2 && ./b2 install	
  - 安装boost的Python支持
    - ./b2 --with-python install

5. 手动安装glog
  按照一般方法安装
  ```
  ./configure
  make
  sudo make install
 
 ```

6. 安装gflags
  - 首先需要安装高版本的cmake
  - mkdir build && cd build
  - export CXXFLAGS="-fPIC" && cmake .. && make VERBOSE=1
  - make && make install
  - Note that glog does not compile with the most recent gflags version (2.1), so before that is resolved you will need to build with glog first.


7. 安装caffe
  - 下载最新的（更新很快）
  - make all -j 8

8. python接口
  - 安装Anaconda-2.2.0
  - 安装caffe依赖
    - 使用pip2pi下载caffe-master/python/requirements.txt中的依赖，搭建内网web服务器
    - 在需要安装caffe的机器上配置～/.pip/pip.conf

        ```
        [golbal]
        index-url = http://192.168.1.240/caffe/software4caffe/python/simple/
        [install]
        trusted-host=192.168.1.240
        ```
    - 然后安装caffe的python依赖
  - 编译python接口`make pycaffe`

9. matlab接口
  - 安装matlab2014a
  - 编译matlab接口，`make  matcaffe`

</markdown>
