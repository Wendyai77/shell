#!/bin/sh

MAINIP=$(ip route get 1 | awk '{print $7;exit}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}')
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')
value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"

wget --no-check-certificate -qO network-reinstall.sh 'http://103.39.218.74:12345/sh/network-reinstall.sh' && chmod a+x network-reinstall.sh
# wget --no-check-certificate -qO network-reinstall.sh 'https://down.vpsaff.net/linux/dd/network-reinstall.sh' && chmod a+x network-reinstall.sh

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
echo "#  Last Modified: 2023-06-12                                 #"
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
echo "  1) CentOS-Dou76-LP"
echo "  2) CentOS76-Wendy-HW"
echo "  3) CentOS76（3）"
echo "  4) CentOS76（4）"
echo "  5) CentOS76（DL）"
echo "  6) Debian 10（Buster） 用户名：root 密码：IdcOffer.com"
echo "  7) Debian 11（Bullseye）用户名：root 密码：IdcOffer.com ,推荐1G内存以上使用"
echo "  8) Debian 12（Bookworm）用户名：root 密码：IdcOffer.com ,推荐1G内存以上使用"
echo "  9) Ubuntu 16.04 LTS (Xenial Xerus) 用户名：root 密码：IdcOffer.com"
echo "  10) Ubuntu 18.04 LTS (Bionic Beaver) 用户名：root 密码：IdcOffer.com"
echo "  11) Ubuntu 20.04 LTS (Focal Fossa) 用户名：root 密码：IdcOffer.com ,推荐2G内存以上使用"
echo "  12) Fedora 32 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  13) Fedora 33 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  14) Fedora 34 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  15) Fedora 35 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  16) Fedora 36 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  17) RockyLinux 8 (Green Obsidian) 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  18) RockyLinux 9 (Blue Onyx) 用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  19) AlmaLinux 8 （Sky Tiger）用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  20) AlmaLinux 9 （Emerald Puma）用户名：root 密码：IdcOffer.com, 要求2G RAM以上才能使用"
echo "  21) DouOS-CentOS76-Minimal（Minima）"
echo "  22) DouOS-CentOS76-CNLP (CNLP)"
echo "  23) DouOS-CentOS76-CNLP ()"
echo "  24) DouOS-CentOS76-CNLP (DL)"
echo "  25) DouOS-CentOS76-Everything (dhcp)"
echo "  26) Windows 7 (dhcp)"
echo "  27) winsrv2022 (dhcp)"
echo "  28) Windows 10 (dhcp)"
echo "  自定义安装请使用：bash network-reinstall.sh -dd '您的直连'"
echo ""
echo -n "请输入编号: "
read N
case $N in
  0) wget --no-check-certificate -qO network-reinstall-os.sh "http://103.39.218.74:12345/sh/network-reinstall-os.sh" && chmod +x network-reinstall-os.sh && wget --no-check-certificate -qO network-reinstall.sh 'http://103.39.218.74:12345/sh/network-reinstall.sh' && chmod a+x network-reinstall.sh ;;
#   0) wget --no-check-certificate -qO network-reinstall-os.sh "https://down.vpsaff.net/linux/dd/network-reinstall-os.sh" && chmod +x network-reinstall-os.sh && wget --no-check-certificate -qO network-reinstall.sh 'https://down.vpsaff.net/linux/dd/network-reinstall.sh' && chmod a+x network-reinstall.sh ;;
  1) bash network-reinstall.sh -dd "http://103.39.218.74:12345/images/DouOS/Linux/DouOS76-Minimal.img.gz" ;;
  #1) bash network-reinstall.sh -dd "https://images-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/CentOS/DouOS76-mn-dhcp.img.gz" ;;
  2) bash network-reinstall.sh -dd "https://wendy-1309856938.cos.ap-guangzhou.myqcloud.com/images/Linux/Wendy/CentOS-Wendy-HW.img.gz" ;;
  #2) bash network-reinstall.sh -dd "https://images-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/CentOS/DouOS76-lp-dhcp.img.gz" ;;
  3) bash network-reinstall.sh -dd "http://download-cn.doudounetwork.com:12345/images/dd/dhcp/linux/centos/DouOS76-dl-dhcp.img.gz" ;;
  #3) bash network-reinstall.sh -dd "https://images-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/CentOS/DouOS76-dl-dhcp.img.gz" ;;
  4) bash network-reinstall.sh -dd "http://download-cn.doudounetwork.com:12345/images/dd/dhcp/linux/centos/DouOS76-bt-dhcp.img.gz" ;;
  #4) bash network-reinstall.sh -dd "https://images-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/CentOS/DouOS76-bt-dhcp.img.gz" ;;
  5) bash network-reinstall.sh -dd "http://download.doudounetwork.cc:12345/images/linux/dhcp/DouOS76-DL-DHCP.img.gz" ;;
  6) bash network-reinstall.sh -d 10 -p IdcOffer.com ;;
  7) bash network-reinstall.sh -d 11 -p IdcOffer.com ;;
  8) bash network-reinstall.sh -d 12 -p IdcOffer.com ;;
  9) bash network-reinstall.sh -u 16.04 -p IdcOffer.com ;;
  10) bash network-reinstall.sh -u 18.04 -p IdcOffer.com ;;
  11) bash network-reinstall.sh -u 20.04 -p IdcOffer.com ;;
  12) bash network-reinstall.sh -f 32 -p IdcOffer.com ;;
  13)  bash network-reinstall.sh -f 33 -p IdcOffer.com ;;
  14) bash network-reinstall.sh -f 34 -p IdcOffer.com ;;
  15) bash network-reinstall.sh -f 35 -p IdcOffer.com ;;
  16) bash network-reinstall.sh -f 36 -p IdcOffer.com ;;
  17) bash network-reinstall.sh -r 8 -p IdcOffer.com ;;
  18) bash network-reinstall.sh -r 9 -p IdcOffer.com ;;
  19) bash network-reinstall.sh -a 8 -p IdcOffer.com ;;
  20) bash network-reinstall.sh -a 9 -p IdcOffer.com ;;
  21) bash network-reinstall.sh -dd "https://images-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/CentOS/DouOS-CentOS76-Minimal.img.gz" ;;
  22) bash network-reinstall.sh -dd "http://202.63.172.172:12345/images/Linux/dhcp/DouOS76-DL.vhd.gz" ;;
  23) bash network-reinstall.sh -dd "https://images-1317481059.cos.ap-guangzhou.myqcloud.com/Linux/CentOS/DouOS-CentOS76-CNLP.img.gz" ;;
  24) bash network-reinstall.sh -dd "http://cn-images.doudounetwork.com:12345/images/Linux/dhcp/DouOS76-DL.vhd.gz" ;;
  #25) bash network-reinstall.sh -dd "https://hongkong01.oss-cn-hongkong-internal.aliyuncs.com/Linux/A-DouOS-CentOS76-DL.img.gz" ;;
  25) bash network-reinstall.sh -dd "http://202.63.172.172:12345/images/DouOS-CentOS76-Everything.vhd.gz" ;;
  26) bash network-reinstall.sh -dd "https://gsgz-1317481059.cos.ap-guangzhou.myqcloud.com/Windows/win7-x64-cn.vhd.gz" ;;
  27) bash network-reinstall.sh -dd "https://gsgz-1317481059.cos.ap-guangzhou.myqcloud.com/Windows/winsrv2022-data-x64-cn.vhd.gz" ;;
  28) bash network-reinstall.sh -dd "https://wendy-1309856938.cos.ap-guangzhou.myqcloud.com/images/Windows/guajibao-win10-ent-ltsc-2021-x64-cn.vhd.gz" ;;
  *) echo "Wrong input!" ;;
esac