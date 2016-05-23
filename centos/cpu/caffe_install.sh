#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   just for CPU, no CUDA

#install caffe on ~
wget https://github.com/BVLC/caffe/archive/master.zip
unzip master.zip
rm master.zip

cp Makefile.config ~/caffe-master
cd ~/caffe-master

#make all -j4
make all
