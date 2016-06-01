#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   caffe on CentOS6.5 with GPU 


#install caffe on ~

wget https://github.com/BVLC/caffe/archive/master.zip
unzip master.zip -d ~/
rm master.zip
cp Makefile.config ~/caffe-master
cd ~/caffe-master

#make all -j4
make all
