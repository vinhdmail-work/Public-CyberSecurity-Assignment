#!/bin/bash
echo "System Information"
today=$(date +%y%m%d)
echo $today
#uname -a

echo "Machine Type Info: " $(uname)
echo -e "IP Info: $(ip addr | grep inet | tail -3 | head -1) \n"
echo -e "Hostname: " $(hostname -s)
echo -e $(systemd-resolve --status | grep 'DNS Servers')

