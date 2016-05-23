# python
# caffe need python2.7 but centos6.5 only has python2.6
# so install anaconda

sudo sh Anaconda-2.2.0-Linux-x86_64.sh
# install on /opt/anaconda

# anaconda config
sudo sh -c 'echo "export PATH=/opt/anaconda/bin:\$PATH" >> /etc/profile'
source /etc/profile

sudo sh -c 'echo "/opt/anaconda/lib" > /etc/ld.so.conf.d/anaconda.conf'
sudo ldconfig
