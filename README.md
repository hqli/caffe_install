# caffe自动安装脚本
[caffe](http://caffe.berkeleyvision.org/)在Ubuntu14.04和CentOS6.7上的自动安装脚本,包含仅cpu和gpu两种方案。
caffe在CentOS6.7上的gpu方案暂未验证。

## 使用方法
详见ubuntu和centos文件下的README.md

## 安装内容

### ubutnu14.04
- caffe的依赖
    - build-essential
    - libprotobuf-dev
    - libleveldb-dev
    - snappy-dev
    - opencv-dev
    - hdf5-serial-dev
    - protobuf-compiler
    - libatlas-base-dev
    - libgflags-dev
    - libgoogle-glog-dev
    - liblmdb-dev
    - python接口的依赖
        - python-dev
        - python-pip
### centos6.7
- caffe的依赖
    - gcc
    - gcc-c++
    - freeglut
    - protobuf-devel
    - leveldb-devel
    - snaapy-devel
    - opencv opencv-devel
    - hdf5-devel
    - gflags-devel
    - lmdb-devel
    - glog-devel（手动编译）
    - boost（手动编译）
    - opencv（手动编译）
    - mkl(手动安装）
    - pyhton接口的依赖
        - Anaconda
        - boost(手动编译）
        - python-devel
        - python-pip

## 安装后
- caffe安装在～/caffe-master文件夹下

## PS
若仅仅学习caffe的用法，建议在虚拟机下运行caffe在ubutnu14.04下的cpu安装方案。

## 主要的问题
- GPU是否支持CUDA
    - 官方查询地址：https://developer.nvidia.com/cuda-gpus
    - 缩水版GPU不支持CUDA
- CentOS6.7安装
    - CentOS默认的是python2.6，caffe的python接口的依赖项需要python2.7
        - 若将系统的默认python改为python2.7会出现诸多问题,一般采用Anaconda来安装
    - CentOS6.7在安装boost时不能使用yum install boost-devel，否则显示缺少-lcblas
        - 手动编译
    - CentOS6.7需要手动安装glog，opencv
    - CentOS6.7在安装BLAS时，若选择atlas则显示cannot find -lcblas，较难解决
        - BLAS选择Intel的mkl
