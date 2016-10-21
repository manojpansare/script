#!/usr/bin/awk -f
BEGIN{
   for (i=1;i<100;i++){
	msg = "";
	if (i%3==0) { msg = msg"Fizz" };
	if (i%5==0) { msg = msg"Buzz" };
	print (length(msg) == 0)? i : msg;
        }
      }
