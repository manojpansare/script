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
   if test -f $backup_dest/$1
   then
      echo "File already exists"
   else
      cp -a $backup_source/$1 $backup_dest
   fi
}

#
##Main
#

cd $backup_source || exit 1
select f in *
do
 backup $f
 break
done
