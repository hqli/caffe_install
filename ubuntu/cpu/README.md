# caffe在ubuntu14.04上安装的cpu方案

## 准备
安装需要联网

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
sh caffe_install.sh

安装过程中要保证联网。
具体请看caffe_install.sh 和caffe-master中的readme。

3. 安装caffe的python接口

sh pycaffe.sh
