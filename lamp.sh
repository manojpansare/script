#!/bin/bash
#Purpose: Test and install LAMP
#Date   : Mon Dec 26 12:46:21 IST 2016
#Author : Manoj Pansare

## Global Variables

os_release_version () {
# This function checks the OS release
rel=$(lsb_release -a)

## if - block

#   if [[ $(lsb_release -a) =~ CentOS|Fedora|Redhat ]] >/dev/null 2>&1
#   then
#		echo "Redhat"
#   else 
#		echo "Ubuntu"
#   fi

## end of if - block

case  $rel in 
    *CentOS*|*Fedora*|*Redhat*)
	echo "Redhat"
    ;;
    *Ubuntu*|*Debian*)
	echo "Ubuntu"
    ;;
    *)
	echo "Unknown version"
    ;;
esac
}


##Main
os_release_version
