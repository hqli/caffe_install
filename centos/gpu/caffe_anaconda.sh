# python
# caffe need python2.7 but centos6.5 only has python2.6
# so install anaconda

sudo sh Anaconda-2.2.0-Linux-x86_64.sh
# install on /opt/anaconda

# anaconda config
sh -c 'echo "export PATH=/opt/anaconda/bin:\$PATH" >> ~/.bashrc'

sh -c 'echo "export LD_LIBRARY_PATH=/opt/anaconda/lib:\$LD_LIBRARY_PATH" >> ~/.bashrc'
source ~/.bashrc
