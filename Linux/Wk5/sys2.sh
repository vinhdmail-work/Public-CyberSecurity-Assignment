#!/bin/bash
if [ $UID = 0 ]
then
echo "Do not run as SUDO"
exit
fi


echo "System Information"
today=$(date +%y%m%d)
echo $today
#uname -a

echo "Machine Type Info: " $(uname)
echo -e "IP Info: $(ip addr | grep inet | tail -3 | head -1) \n"
echo -e "Hostname: " $(hostname -s)
echo -e $(systemd-resolve --status | grep 'DNS Servers')


output


if [ -d ~/research ]
then
echo "/research exists"
else
echo "Making /research directory"
sudo mkdir ~/research
fi

if [ -f ~/research/sys_info.txt ]
then
sudo rm ~/research/sys_info.txt ]
fi

ipresult==$(ip addr | grep inet | tail -2 | head -1) 

echo $ipresult
#echo "$ipresult"

searchresult==$(find /home -type f -perm 777)
echo $searchresult
echo "$searchresult"

