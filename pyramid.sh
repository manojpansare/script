#!/bin/bash
read -p "Please enter the height of pyramid in digit : " ht

###### To check entered value is integer or NOT #########

if [[ -z $ht ]] || ! [[ -z $(echo $ht | tr -d {0-9}) ]]
then
   echo "Please enter valid number"
   exit 1
fi

###### Pyramid Implementation ######
#### (We'll consider height of 3 rows) #######
# This will happen in two parts
# 1st i.e. Left part
#  *
# **
#***
# AND 2nd i.e. Right part which starts from 2nd row as below
#   
#   *
#   **
# AND Final output will look like
#  *
# ***
#*****

for ((i=1;i<=ht;i++)) 
do

###### Spaces ########

   for ((sp=i;sp<ht;sp++))
   do
	printf " "
   done

###### Left side Pyramid ##########

   for ((le_pyr=1;le_pyr<=i;le_pyr++)) # for height of Pyramid
   do
	printf "*"
   done

###### Right side Pyramid #########
# Right Side pyramid will start from second row

   for ((rt_pyr=2;rt_pyr<le_pyr;rt_pyr++))
   do
	printf "*"
   done

###### To add new line after 1 loop ######

   printf "\n"
done
