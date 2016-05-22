#title  :   caffe install on CentOS6.7
#author :   Li Huaqing
#see    :   just for CPU, no CUDA

#install caffe on ~
cd ~

sudo apt-get install -y wget unzip
wget https://github.com/BVLC/caffe/archive/master.zip
unzip master.zip
rm master.zip

cd ~/caffe-master

cp Makefile.config.example Makefile.config
echo "CPU_ONLY := 1">>Makefile.config
sed -i "s/BLAS := atlas/BLAS := mkl/g" Makefile.config

#make all -j4
make all
