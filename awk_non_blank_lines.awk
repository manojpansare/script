#!/bin/awk -f
{ if (NF!=0) {
    non_blank_lines++
             }
  else {
    blank_lines++
       }
}
END {
   print "Number of lines       : ", non_blank_lines
   print "Number of blank lines : ", blank_lines
    }
