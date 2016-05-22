#caffe install on Ubuntu14.04
#author：李华清 
#just for CPU
#no CUDA matlab interface

#please updata Software Source before install 

#install caffe on ~

cd ~

wget https://github.com/BVLC/caffe/archive/master.zip
unzip master.zip
rm master.zip

cd caffe-master

cp Makefile.config.example Makefile.config
echo "CPU_ONLY := 1">>Makefile.config
make all
