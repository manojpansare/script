#!/bin/bash

#To check the number is prime or not

read -p "Please enter a number : " n
#echo " Sqrt of $n is $(echo "sqrt($n)" | bc)"
#--------------------------------------------------#
## To check whether input is Non-Zero AND Integer ##
   if [[ -z $n ]] || [[ ! $n =~ [0-9] ]]
   then 
	echo "You must enter a number"
	exit 1
   fi
#--------------------------------------------------#
## To check whether number is Even                ##
   if [[ $(( n%2 )) -eq 0 ]] && [[ $n -gt 2 ]];
   then
	echo "$n is not a prime number"
	exit 1
   fi
#---------------------------------------------------#
## Actual Maths                                    ##
for i in $( seq 3 2 $(echo "sqrt($n)" | bc))
do
#    echo " value of i is $i"
    if [[ $((n%i)) -eq 0 ]] 
    then
	echo "$n is not a prime number"
	exit 1
    fi
done
	echo "$n is a prime number"
