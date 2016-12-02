#!/bin/bash
#Date : Sat Nov 26 19:10:55 IST 2016
#Purpose : To check server status
#Author : Manoj

#
##Functions
#
check_mem () {
      echo -e "\e[4;36mMemory Status\e[0m"
      free -m | awk '{if (NR==1) print ":",$1,":",$2,":",$3; else print $1,$2,":",$3,":",$4}' | column -t -s ":"
}
check_disk () {
      echo -e "\e[4;36mDisk Status\e[0m"
      df -h
}
check_cpu () {
      echo -e "\e[4;36mCPU Status\e[0m"
      uptime
      ps -eo pcpu,pid,args | sort -k 1 -r | head -10
}

#
##Main
#

clear
echo "##################################################################"
echo -e "Status of \e[4;36m'$(hostname)'\e[0m server on \e[4;36m'$(date +"%d-%m-%Y %H:%M")'\e[0m"
echo "##################################################################"
#awk '/model\ name|cpu\ MHz/{print}' /proc/cpuinfo
#Create Menu
whiptail  --menu "ServerStatus" 12 50 3 \
                1 Check_CPU \
                2 Check_Memory \
                3 Check_Disk \
                              2> /tmp/option

#Check the selected Item
a=$(cat /tmp/option)
case $a in
   1)
      check_cpu
   ;;
   2)
      check_mem
   ;;
   3)
      check_disk
   ;;
esac
