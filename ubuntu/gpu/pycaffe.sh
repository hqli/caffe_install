#python interface

#caffe安装在～/caffe-master下
#运行时需要联网

#安装python开发者环境和安装python模块的pip
sudo apt-get install python-dev python-pip
#进入caffe-master
cd ~/caffe-master
#依次安装caffe的python接口的依赖项
for req in $(cat python/requirements.txt); do
        sudo pip install $req;
done
make pycaffe

