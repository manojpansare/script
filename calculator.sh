#!/bin/bash
echo "Calculator"
echo -e "\e[4mAddition\e[0m(+),\e[4mSubtraction\e[0m(-),\e[4mMultiplication\e[0m(*),\e[4mDivision\e[0m(/),\e[4mRemainder\e[0m(%),\e[4mPower Of\e[0m(^)"
echo -e "\e[4mEnter the sum (In the form of <num1><operator><num2>) : \e[0m" 
read string 
operation=$(echo $string | tr -d {0-9})
case $operation in
 ^)
    num1=${string%%\^*}
    num2=${string##*\^}
    ans=$((num1-$((num1/num2))))
    echo $ans
 ;;
 *)
    ans=$((string))
    echo $ans
 ;;
esac
