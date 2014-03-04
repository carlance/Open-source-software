#!/bin/bash

get_request='get_request.tmp'
get_request_1='get_request_1.tmp'
ip_addr_get='ip_addr_get.tmp'
FILE='ipv6.tmp'

printf "Script running...\n"

#printf "--------BASH SCRIPT RESULTS-------\n\n" >>top10.txt

#List top 10 visitors to site by IP address
printf "TOP 10 IP VISITORS\n" >> top10.txt
grep "GET" $1 > $get_request_1 #Grabs lines with the word GET
cat $get_request_1 | sort > $get_request # Sorts the lines first to uniq them easily
cut -f 1 -d ' ' $get_request | uniq -c 	> $ip_addr_get #Cut 1st field split by space and count number of occurence
cat $ip_addr_get| sort -nr | head >> top10.txt # Sort top 10 ip addresses and save result to text file
printf "\n" >> top10.txt

#List top 10 pdf downloads
printf "TOP 10 PDF DOWNLOADS\n" >> top10.txt
grep ".pdf" $1> pdfraw1.tmp #Grabs lines with the word .pdf
cat pdfraw1.tmp | cut -f 2 -d '"' > pdfraw2.tmp # sort file
cat pdfraw2.tmp | cut -f 2 -d ' ' > pdfraw3.tmp #Takes previous file and cuts 2nd field split by space
cat pdfraw3.tmp | sort > pdfraw4.tmp #sorts file
cat pdfraw4.tmp | uniq -c > pdfraw5.tmp # counts number of occurrences
cat pdfraw5.tmp | sort -nr | head >> top10.txt #Sort the top 10 pdf downloads from highest to lowest and save result to text file
printf "\n" >> top10.txt



#List top 5 browsers
printf "TOP 5 BROWSERS\n" >> top10.txt
grep "GET" $1 > get_only.tmp #Grabs lines with the word GET
cut -f 6 -d '"' get_only.tmp > get_browsers1.tmp #Cuts 6th field split by " 
cat get_browsers1.tmp | sort | uniq -c  > get_browsers_uniq.tmp #Counts number of occurences and sorts
#cat get_browsers_uniq.tmp | uniq -c > get_browsers2.tmp
cat get_browsers_uniq.tmp | sort -nr | head -n 5 >> top10.txt # Sort top 5 web browsers used and save result to text file
printf "\n" >> top10.txt



#List ipv6 visitors
printf "TOP IPV6 VISITORS\n" >> top10.txt
grep "::" $1 > $FILE #Grabs lines with the characters ":"
cut -d ' ' -f 1 $FILE |sort > ipv6raw1.tmp #Cuts first field split by space
cat ipv6raw1.tmp | uniq -c > ipv6raw2.tmp # Count number of occurence
cat ipv6raw2.tmp | sort -nr |head >> top10.txt #Save result to text file
 

#remove .tmp files
rm *.tmp

printf "Finished running...\n"
