#!/bin/sh

MAINIP=$(ip route get 1 | awk '{print $7;exit}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}')
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')
value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"

wget --no-check-certificate -qO network-reinstall.sh 'http://cn.dou-dou.cc:12345/sh/OS/network-reinstall.sh' && chmod a+x network-reinstall.sh

#Disabled SELinux
if [ -f /etc/selinux/config ]; then
	SELinuxStatus=$(sestatus -v | grep "SELinux status:" | grep enabled)
	[[ "$SELinuxStatus" != "" ]] && setenforce 0
fi

clear
echo "                                                              "
echo "##############################################################"
echo "#                                                            #"
echo "#  Network reinstall OS                                      #"
echo "#                                                            #"
echo "#  Last Modified: 2022-08-24                                 #"
echo "#  Linux默认密码：IdcOffer.com                               #"
echo "#  Supported by idcoffer.com                                 #"
echo "#                                                            #"
echo "##############################################################"
echo "                                                              "
echo "IP: $MAINIP/$SUBNET"
echo "网关: $GATEWAYIP"
echo "网络掩码: $NETMASK"
echo ""
echo "请选择您需要的镜像包:"
echo "  0) 升级本脚本"
echo "  1) CentOS 7.6（Minimal-自动扩容硬盘） 用户名：root 密码：IdcOffer.com"
echo "  2) CentOS 7.6（LP-自动扩容硬盘） 用户名：root 密码：IdcOffer.com"
echo "  3) CentOS 7.6（NPS） 用户名：root 密码：IdcOffer.com"
echo "  4) CentOS 7.6（BT） 用户名：root 密码：IdcOffer.com"
echo "  5) CentOS 7.6（DL-自动扩容硬盘） 用户名：root 密码：IdcOffer.com"
echo "  6) Windows_Server_2022 用户名：Administrator 密码：IdcOffer.com"
echo "  7) Disk_Windows_Server_2012R2 用户名：Administrator 密码：IdcOffer.com"
echo "  8) Windows_10 用户名：Administrator 密码：nat.ee"
echo "  9) Windows_7 用户名：Administrator 密码：nat.ee"
echo "  10) Fedora 34 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  11) Debian 10（Buster） 用户名：root 密码：IdcOffer.com"
echo "  12) Debian 11（Bullseye）用户名：root 密码：IdcOffer.com ,推荐1G内存以上使用"
echo "  13) CentOS 7 x64 (DD) 用户名：root 密码：Pwd@CentOS"
echo "  14) CentOS 7.9 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  15) Ubuntu 16.04 LTS (Xenial Xerus) 用户名：root 密码：IdcOffer.com"
echo "  16) Ubuntu 18.04 LTS (Bionic Beaver) 用户名：root 密码：IdcOffer.com"
echo "  17) Ubuntu 20.04 LTS (Focal Fossa) 用户名：root 密码：IdcOffer.com ,推荐2G内存以上使用"
echo "  18) Fedora 32 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  19) Fedora 33 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  20) Fedora 34 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  21) Fedora 35 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  22) Fedora 36 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  23) RockyLinux 8 (Green Obsidian) 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  24) RockyLinux 9 (Blue Onyx) 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  25) AlmaLinux 8 （Sky Tiger）用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  26) AlmaLinux 9 （Emerald Puma）用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  27) CentOS 7.6（Desktop） 用户名：root 密码：IdcOffer.com"
echo "  28) CentOS 7.6（KS-HK） 用户名：root 密码：IdcOffer.com"
echo "  29) UnifiOS-Ubuntu 用户名：root 密码：IdcOffer.com"
echo "  30) ESXi-6.7 用户名：root 密码：IdcOffer.com"
echo "  31) CentOS 7.6（Minimal-不自动扩容硬盘） 用户名：root 密码：IdcOffer.com"

echo "  自定义安装请使用：bash network-reinstall.sh -dd '您的直连'"
echo ""
echo -n "请输入编号: "
read N
case $N in
  0) wget --no-check-certificate -qO network-reinstall-os.sh "http://cn.dou-dou.cc:12345/sh/OS/-os.sh" && chmod +x network-reinstall-os.sh && wget --no-check-certificate -qO network-reinstall.sh 'http://cn.dou-dou.cc:12345/sh/OS/network-reinstall.sh' && chmod a+x network-reinstall.sh ;;
#  1) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://cn.dou-dou.cc:12345/images/DouOS/Linux/DouOS76-Minimal-Auto.img.gz' ;;
  1) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://gsgz-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/DouOS/CentOS76/DouOS76-Minimal-Auto.img.gz' ;;  
#  2) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://cn.dou-dou.cc:12345/images/DouOS/Linux/DouOS76-LP-1810.img.gz' ;;
  2) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://gsgz-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/DouOS/CentOS76/DouOS76-LP-1810.img.gz' ;;
  3) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://dou-edu.com/Image/Linux/CentOS76-NPS-Server.img.gz' ;;
  4) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://dou-edu.com/Image/Linux/CentOS76-BT-Server.img.gz' ;;
  5) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://gsgz-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/DouOS/CentOS76/DouOS76-HW-1810.img.gz' ;;
#  5) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://dou-dou.cc/Linux/DouOS/CentOS76/DouOS76-HW-1810.img.gz' ;;
  6) echo "Password: cxthhhhh.com" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://odc.cxthhhhh.com/d/SyStem/Windows_DD_Disks/Disk_Windows_Server_2022_DataCenter_CN_v2.12.vhd.gz' ;;
  7) echo "Password: cxthhhhh.com" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://odc.cxthhhhh.com/d/SyStem/Windows_DD_Disks/Disk_Windows_Server_2012R2_DataCenter_CN_v4.29.vhd.gz' ;;
  8) echo "Password: nat.ee" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://dou-edu.com/Image/Windows/centos76Mini.img.gz' ;;
  9) echo "Password: cxthhhhh.com" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://odc.cxthhhhh.com/d/SyStem/Windows_DD_Disks/Disk_Windows_Server_2022_DataCenter_CN_v2.12_UEFI.vhd.gz' ;;
  10) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://api.moetools.net/get/centos-76-image' ;;
  11) bash network-reinstall.sh -d 10 -p IdcOffer.com ;;
  12) bash network-reinstall.sh -d 11 -p IdcOffer.com ;;
  13) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://down.vpsaff.net/linux/dd/images/centos-7-image' ;;
  14) bash network-reinstall.sh -c 7 -p IdcOffer.com ;;
  15) bash network-reinstall.sh -u 16.04 -p IdcOffer.com ;;
  16) bash network-reinstall.sh -u 18.04 -p IdcOffer.com ;;
  17) bash network-reinstall.sh -u 20.04 -p IdcOffer.com ;;
  18) bash network-reinstall.sh -f 32 -p IdcOffer.com ;;
  19)  bash network-reinstall.sh -f 33 -p IdcOffer.com ;;
  20) bash network-reinstall.sh -f 34 -p IdcOffer.com ;;
  21) bash network-reinstall.sh -f 35 -p IdcOffer.com ;;
  22) bash network-reinstall.sh -f 36 -p IdcOffer.com ;;
  23) bash network-reinstall.sh -r 8 -p IdcOffer.com ;;
  24) bash network-reinstall.sh -r 9 -p IdcOffer.com ;;
  25) bash network-reinstall.sh -a 8 -p IdcOffer.com ;;
  26) bash network-reinstall.sh -a 9 -p IdcOffer.com ;;
  27) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://download.doudou-tools.com:5566/Image/Linux/CentOS76-Desktop.img.gz' ;;
  28) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://download.doudou-tools.com:5566/Image/Linux/ESXi-7.img.gz' ;;
  29) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://download.doudou-tools.com:5566/Image/Linux/UnifiOS-Ubuntu.img.gz' ;;
  30) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://download.doudou-tools.com:5566/Image/Linux/ESXi-67.img.gz' ;;
  31) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'https://gsgz-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/DouOS/CentOS76/DouOS76-Minimal.img.gz' ;;
#  31) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash network-reinstall.sh -dd 'http://dou-dou.cc/Linux/DouOS/CentOS76/DouOS76-Minimal.img.gz' ;;
  *) echo "Wrong input!" ;;
esac