# caffe在ubuntu14.04上安装的gpu方案

## 准备
- 安装需要联网
- 下载cuda_7.5.18_linux.run与该README.md放在同一文件夹下
    - 下载地址https://developer.nvidia.com/cuda-toolkit-archive

## 步骤
1. 安装Caffe前
** 软件源配置

系统设置—>软件和更新—>下载自—>其它站点
选择最佳服务器—>选择服务器
国内推荐清华的源
一般会默认更新软件源

若未自动更新需要手动更新：
sudo apt-get update
为了方便编辑文本，更新VIM
sudo apt-get install vim


2. 安装Caffe
** CUDA安装
设置BIOS为集显(UMA)，重启按Ctrl+Alt+F1进入字符界面
sh caffe_install_1.sh
根据提示安装驱动以及CUDA
重启

** caffe安装
sh caffe_install_2.sh
具体请看caffe_install_2.sh 和caffe-master中的readme。

3. 安装caffe的python接口

sh pycaffe.sh
