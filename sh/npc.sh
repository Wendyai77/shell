systemctl stop firewalld
systemctl mask firewalld
wget --no-check-certificate http://dou-dou.cc/nps/npc.tar.gz
# wget -o /root/npc.tar.gz --no-check-certificate http://dou-dou.cc/nps/linux_arm_v7_client.tar.gz
mkdir /opt/npc && tar -zxvf npc.tar.gz -C /opt/npc
cat > tn.sh <<EOF
pkill npc
cd /opt/npc
nohup npc /opt/npc >/dev/null 2>&1 &./npc install -server=x.x.x:18024 -vkey=0 -type=tcp && sudo ./npc start
EOF
chmod +x tn.sh