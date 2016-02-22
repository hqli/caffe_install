# caffe在centos6.7上安装的cpu方案

## 准备
- 安装需要联网
- 将自己添加到sudo组
    - 使用su命令，进入特权模式
    - 输入visudo命令
    - 在root    ALL=(ALL)       ALL下面，添加你的用户名    ALL=(ALL)       ALL
    - 保存并退出特权模式

- 需要下载的软件放在百度云网盘上：http://pan.baidu.com/s/1qXmy4Uw
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

## 步骤
1. 安装Intel的mkl即parallel_studio_xe
    - 默认安装到/opt下
2. 安装Caffe
sh caffe_install.sh

具体请看caffe_install.sh 和caffe-master中的readme。

3. 安装caffe的python接口

- sh pycaffe.sh
- 根据提示安装Anaconda到/usr/local/lib/

## 其他
如果所使用的Anaconda，mkl，boost，opencv等软件版本不一致，可以对应地更改sh文件。
