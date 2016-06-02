# caffe在centos6.7上安装的cpu方案

## 准备
- 安装需要联网
- 将自己添加到sudo组
    - 使用su命令，进入特权模式
    - 输入visudo命令
    - 在root    ALL=(ALL)       ALL下面，添加你的用户名    ALL=(ALL)       ALL
    - 保存并退出特权模式

- 需要下载的软件已经放在百度云网盘上：http://pan.baidu.com/s/1qXmy4Uw
- 下载Anaconda-2.2.0-Linux-x86_64.sh(318M)
    - Anaconda下载地址: https://www.continuum.io/downloads#_unix
- 下载Intel的mkl即parallel_studio_xe_2015_update3.tgz(3.9G，这是以前的)放在README.md同一文件夹下
    - 下载地址: https://software.intel.com/en-us/intel-parallel-studio-xe/try-buy
    - Intel的parallet_studio_xe更新快，现在是2016版本。
    - 学生可以申请免费版本
- 下载boost_1_59_0.tar.bz2(68M)放在README.md同一文件夹下
    - 下载地址: http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download
- 下载glog-0.3.3.tar.gz，放在README.md同一文件夹下
    - 下载地址：https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz 
- 下载opencv-2.4.9.zip，放在README.md同一文件夹下
    - https://github.com/Itseez/opencv/archive/2.4.9.zip
- 下载gflags-master.zip,放在README.md同一文件夹下
    - https://codeload.github.com/gflags/gflags/zip/master
- 下载cmake-3.5.0.tar.gz,放在README.md同一文件夹下
    - https://github.com/Kitware/CMake/archive/v3.5.0.zip

## 步骤

### 安装需要yum安装的软件
需要联网  
切换到root用户  
在终端输入`sudo sh caffe_yum.sh`


### BLAS

#### 方案1. 安装Intel的mkl即parallel_studio_xe(默认)
- 切换到root用户
- 终端输入`sudo sh caffe_mkl.sh`
- 默认安装到/opt下

#### 方案2. atlas
- 需要安装yum -y install blas blas-devel atlas atlas-devel atlas-sse3 atlas-sse3-devel lapack lapack-devel
- 编译caffe时修改caffe-master/Makefile.config中的BLAS_LIB:=/usr/lib64/atlas

### 安装opencv
- 切换到root用户
- 终端输入`sudo sh caffe_opencv.sh`

### 安装Caffe依赖
- 切换到root用户
- 终端输入`sudo sh caffe_dependence.sh`

### 安装Caffe
- 切换到使用caffe的用户
- 需要联网
- 终端输入`sh caffe_install.sh`

具体请看caffe_install.sh 和caffe-master中的readme。

### 安装caffe的python接口
1. 安装anaconda
    - 切换到使用caffe的用户
    - 终端输入sh caffe_anaconda.sh`
    - 根据提示安装Anaconda到/opt/anaconda

2. 编译caffe的python接口
    - 切换到使用caffe的用户
    - 需要联网
    - 终端输入`sh pycaffe.sh`

### 安装caffe的matlab接口

前提:已经安装matlab,安装教程自行百度或谷歌

- 配置
    - 修改~/caffe-master文件夹下的Makefile.config
    - 修改MATLAB_DIR一行
    - 以R2014a为例,MATLAB_DIR :=/usr/local/MATLAB/R2014a
- 编译
    - 然后在终端,进入~/caffe-master目录,执行
    - `make matcaffe`

## 其他
- 如果所使用的Anaconda，mkl，boost，opencv等软件版本不一致，需要更改sh文件中的对应内容。
- 安装新版本的caffe后出现tools/caffe.cpp: In function ‘int main(int, char**)':tools/caffe.cpp:394: 错误：‘’不是‘gflags’的成员
    - 这是由于caffe新版本/toots/caffe.cpp在394行增加了gflags的SetVersionString这一行，以前的gflags版本没有。
    - 手动编译gflags。
-  pydot的问题，应该用/opt/anaconda/bin/pip先卸载pydot，然后安装pydot2

