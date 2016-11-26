#!/bin/bash
echo "##################################################################"
echo -e "Status of \e[0;34;47m'$(hostname)'\e[0m server on '$(date +"%d-%m-%Y %H:%M")'"
echo "##################################################################"
echo -e "\e[0;34;47mServer config : \e[0m "
echo "----------------"
echo "---Processor---"
echo -e "\e[4mSpecification : \e[0m"
echo "$(grep "model name\|cpu MHz" /proc/cpuinfo)"
#awk '/model\ name|cpu\ MHz/{print}' /proc/cpuinfo
echo -e "\e[4mCurrent Usage : \e[0m"
echo "$(ps -eo pcpu,pid,user,args |sort -k 1 -r| head -10)"
echo -e "\e[4m----------------\e[0m"
echo -e "\e[4m---Memory---\e[0m"
free -m | awk '{if (NR==1) print ":",$1,":",$2,":",$3; else print $1,$2,":",$3,":",$4}' | column -t -s ":"

#-----------------------------------------------------------------------------
#!/bin/bash
#Date : Sat Nov 26 19:10:55 IST 2016
#Purpose : To check server status
#Author : Manoj

#
##Functions
#
check_mem () {
      echo "Memory Status"
      free -m
}
check_disk () {
      echo "Disk Status"
      df -h
}
check_cpu () {
      echo "CPU Status"
      echo "uptime is $(uptime)"
      ps -eo pcpu,pid,args | sort -k 1 -r | head -10
}

#
##Main
#

#Create Menu
whiptail  --menu "ServerStatus" 12 50 3 \
                1 Check_CPU \
                2 Check_Memory \
                3 Check_Disk \
                              2> /tmp/option

#Check the selected Item
a=$(cat /tmp/option)
case $a in

#----------------------------------------------------

