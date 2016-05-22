#caffe install on Ubuntu14.04 with GPU 
#install -y caffe on ~
cd ~

wget https://github.com/BVLC/caffe/archive/master.zip

unzip master.zip
rm master.zip

cd caffe-master

cp Makefile.config.example Makefile.config
make all
