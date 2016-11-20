#!/bin/bash
echo "##################################################################"
echo -e "Status of \e[0;34;47m'$(hostname)'\e[0m server on '$(date +"%d-%m-%Y %H:%M")'"
echo "##################################################################"
echo -e "\e[0;34;47m Server config : \e[0m "
echo "----------------"
echo "Processor : "
echo "$(grep "model name\|cpu MHz" /proc/cpuinfo)"
#awk '/model\ name|cpu\ MHz/{print}' /proc/cpuinfo
echo "Memory : "

