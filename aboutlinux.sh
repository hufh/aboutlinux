#!/bin/sh
# License: GPLv3

# Show CPU info
echo "CPU Model    : `cat /proc/cpuinfo |grep CPU |uniq | awk '{$1=$2=$3="";print $0}'`"
echo "Total Cores  : `cat /proc/cpuinfo |grep CPU |wc -l`"

# Show memory info
mem=`cat /proc/meminfo | grep MemTotal | awk '{print $2}'`
GB=`expr $mem / 1024 / 1000`
echo "Memory       : $GB GB"

# Root info
rootdev=`mount |grep "on / " |awk '{print $1}'`
volinKB=`fdisk -s $rootdev`
volinGB=`expr $volinKB / 1024 / 1000`
echo "Root device  : $rootdev"
echo "Root volume  : $volinGB GB"

#OS Info
echo "OS           : `cat /etc/system-release`"
echo "Kernel       : `uname -r`"

