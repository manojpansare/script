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
echo "----------------"
echo "---Memory---"

