#!/bin/bash

get_request='get_request.tmp'
ip_addr_get='ip_addr_get.tmp'
FILE='ipv6.tmp'

#exec < $get_request
#while read line
#do
#cut -f 1 -d ' ' | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n  > $ip_addr_get
#done 

#List top 10 visitors to site by IP address
grep "GET" $1 > $get_request   #Grabs lines with the word GET
cut -f 1 -d ' ' $get_request |  uniq -c > $ip_addr_get  #Cut 1st field split by space and count number of occurence
cat $ip_addr_get| sort -nr  > top10ip.txt # Sort top 10 ip addresses and save result to text file


#List top 10 pdf downloads
grep ".pdf" $1> pdfraw1.tmp  #Grabs lines with the word .pdf
cat pdfraw1.tmp | cut -f 2 -d '"' > pdfraw2.tmp #Cuts the second field split by " and saves to tmp file
cat pdfraw2.tmp | cut -f 2 -d ' ' > pdfraw3.tmp #Takes previous file and cuts 2nd field split by space
cat pdfraw3.tmp | uniq  -c > pdfraw4.tmp #Counts number of occurences of a line
cat pdfraw4.tmp | sort -nr | head > top10pdf.txt #Sort the top 10 pdf downloads from highest to lowest and save result to text file



#List top 5 browsers 
grep "GET" $1 > get_only.tmp #Grabs lines with the word GET
cat get_only.tmp | cut -f 6 -d '"' > get_browsers.tmp #Cuts 6th field split by "
cat get_browsers.tmp | uniq  -c > get_browsers_uniq.tmp #Counts number of occurences 
cat get_browsers_uniq.tmp | sort -nr | head -n 5 > top5browser.txt # Sort top 5 web browsers used and save result to text file



#List ipv6 visitors
grep "::" $1 > $FILE  #Grabs lines with the characters ":"
cut -d ' ' -f 1 $FILE |sort > ipv6raw1.tmp #Cuts first field split by space 
cat ipv6raw1.tmp | uniq  -c > ipv6raw2.tmp # Count number of occurence
cat ipv6raw2.tmp | sort -nr > topipv6.txt #Save result to text file
 

# for ip in `cat $FILE |cut -d ' ' -f 1 |sort |uniq`;
# do { 
#  	COUNT=`grep ^$ip $FILE |wc -l`;
# 	echo "$COUNT:   $ip" >> topipv6.txt
#}; 	done
 

rm *.tmp


 

