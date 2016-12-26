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
	rel_ver="Redhat"
    ;;
    *Ubuntu*|*Debian*)
	rel_ver="Ubuntu"
    ;;
    *)
	echo "Unknown version"
    ;;
esac
}
apache_status () {
os_release_version
if [[ $rel_ver == "Redhat" ]] 
then
    service httpd status >/dev/null 2>&1
    if [[ $? = 0 ]]
    then
         service httpd start
    else
         yum -y install httpd
         service httpd start
    fi
else
    service apache2 status >/dev/null 2>&1
    if [[ $? = 0 ]]
    then
         service apache2 start
    else
         apt-get update
         apt-get -y install apache2
         service apache2 start
    fi
fi
}

##Main
apache_status
