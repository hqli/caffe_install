# caffe在ubuntu14.04上安装的cpu方案

## 准备
安装需要联网

## 步骤
### 安装Caffe前
** 软件源配置

系统设置—>软件和更新—>下载自—>其它站点
选择最佳服务器—>选择服务器
国内推荐清华的源

一般会默认更新软件源
若未自动更新需要手动更新：
sudo apt-get update
为了方便编辑文本，更新VIM
sudo apt-get install vim

### 安装Caffe
sh caffe_install.sh

安装过程中要保证联网。
具体请看caffe_install.sh 和caffe-master中的readme。

### 安装caffe的python接口

sh pycaffe.sh

如果安装一些python软件的时候出现问题,可以使用apt-get install python-对应的包  
以scikit-image为例

- apt-cache search scikit-image
    - 查询
    - python-skimage - Python modules for image processing
    - python-skimage-doc - Documentation and examples for scikit-image
    - python-skimage-lib - Optimized low-level algorithms for scikit-image
    - python3-skimage - Python 3 modules for image processing
    - python3-skimage-lib - Optimized low-level algorithms for Python 3 scikit-image
- sudo apt-get install python-skimage

### 安装caffe的matlab接口
前提:已经安装matlab,安装教程自行百度或谷歌

- 配置
    - 修改~/caffe-master文件夹下的Makefile.config
    - 修改MATLAB_DIR一行
    - 以R2014a为例,MATLAB_DIR :=/usr/local/MATLAB/R2014a
- 编译
    - 然后在终端,进入~/caffe-master目录,执行
    - `make matcaffe`
