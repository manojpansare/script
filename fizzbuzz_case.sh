#!/bin/bash
    for ((i=1;i<=100;i++))
    do
	msg=''
	((i%3)) || msg+='Fizz'
	((i%5)) || msg+='Buzz'
        case $msg in
	   '') echo $i ;;
	    *) echo $msg ;;
	esac
    done
