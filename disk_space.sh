#!/bin/bash
#Date	: Fri Dec  2 20:13:30 IST 2016
#Purpose: Check disk space and send mail if disk is running out of space
#Author : Manoj

#Set alert level
alert=50

df -h | grep -vE 'Filesystem|tmpfs|cdrom' |  # Filter and redirect output to while loop \
while read output
do
  usedpercent=$(echo $output | awk '{ print $5 }' | tr -d [=%=] )
  partition=$(echo $output | awk '{ print $1,":","MountPoint:",$6 }')
  if [[ $usedpercent -ge $alert ]]
  then
     echo -e "\e[4;36m$partition ($usedpercent%)\e[0m is running out of space on server \e[4;36m$(hostname)\e[0m,$(date)"
  fi
done
