#!/bin/bash
read -p "Please enter a number : " num
if [[ -z $num ]] || ! [[ -z $( echo $num | tr -d {0-9} ) ]] 
#! [[ $num =~ [0-9] ]] || [[ $num =~ [a-zA-Z] ]]
then
   echo "Please enter a valid number"
elif [[ $( echo $num | rev) == $num ]]
then
   echo "Number is palindrome"
else
   echo "Number is not palindrome"
fi
