#caffe install on CentOS6.5 with GPU 

#Set BIOS start only with UMA
#ctrl+Alt+F1 

# 在配置文件中禁用nouveau
sudo rm /etc/modprobe.d/blacklist-nouveau.conf

sudo echo "blacklist nouveau">>/etc/modprobe.d/blacklist-nouveau.conf
sudo echo "options nouveau modeset=0">>/etc/modprobe.d/blacklist-nouveau.conf

# 备份原来的 initramfs nouveau image镜像
sudo mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img
# 创建新的 initramfs image镜像
sudo dracut /boot/initramfs-$(uname -r).img $(uname -r)
#then reboot
