systemctl stop firewalld
systemctl mask firewalld
wget http://cn.dou-dou.cc:12345/software/nps/nps.tar.gz
mkdir /opt/nps && tar -zxvf nps.tar.gz -C /opt/nps && cd /opt/nps && ./nps install
nps start
