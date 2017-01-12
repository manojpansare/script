#!/bin/bash
# Date    : Sat Nov 26 18:42:28 IST 2016
# Purpose : Take the backup
# Author  : Manoj

#
##Accepting and Reading user input
#

read -p "Enter the path of file : " backup_source
read -p "Enter the backup path  : " backup_dest

#
##Backup Function
#

backup () {
   touch /tmp/backup.lock
   if test -f $backup_dest/$1
   then
      echo "File already exists"
   else
      cp -a $backup_source/$1 $backup_dest
   fi
}

cleanup () {
   rm -rvf /tmp/backup.lock
}

#
##Main
#

trap cleanup SIGINT SIGTERM SIGTSTP SIGHUP
cd $backup_source || exit 1
select f in *
do
 if [[ -f /tmp/backup.lock ]]
 then
    echo "Backup is already running"
 else
    backup $f
    cleanup
 fi
 break
done
#######################################################
# TEMP=$(getopt -o s:d:r::  --long source:,dest:,rm:: -- "$@" )
# eval set -- "$TEMP"
#while true
#do
#  case "$1"in
#     -s|--source) SOURCE=$2; shift 2 ;;
#     -d|--dest)   DEST=$2; shift 2 ;;
#     -r|--rm) RM=$1; shift 2 ;;
#     --)          shift; break;;
#  esac
#done
