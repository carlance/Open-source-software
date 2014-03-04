#!/usr/bin/python
# import the libraries needed
import collections
import sys
import re
import socket
from urllib import urlopen

def Top10Domain(FileName):
    #load the file needed to be accessed
    access_file = open(FileName, "r")
    #create a list of logs
    log_array=[]
    #counter
    i = 1
    #read each line in the access file
    for line in access_file:
   	 #"try" this statements
    		 try:
   	  	#this makes sure that you don't look at the start of the access file
   	  	if not "::1"in line:
   		  	 #add the data to the array from the file
   		  	 #Look for the part between the start and end index specified
   		 #the "+0" is the offset in which where it would start recording the line
   		   	 log_array.append(line[line.index("")+0:line.index("- -")])
   	 
   	 #if the "try" fails ("else" in "if else" function)
   		 except:
   		 #just pass or skip
   			 pass
    #initialise the counter to count the number of occurrences of the same data
    counter = collections.Counter(log_array)
    
    #this will return a list of most common elements and their accounts from highest to lowest
    #(10) can be change to any value

    new_file = open("top10domain.txt",'w')
    new_file.write("No:    Count:     Domain name: \n")
    for count in counter.most_common(10):
   	 #str prints out the numbers from 1 - 10
            	#etfqdn is equivalent to "whois" in linux (no internet = no work)
   		 #Saves results to a new file
   	 new_file.write(str(i) + "\t" + str(count[1]) + "\t" + socket.getfqdn(str(count[0])))
   	 new_file.write('\n')
   	 #increment counter to look at the next data
   	 i = i + 1
    #stops reading
    access_file.close()
    new_file.close()


def Top10IP(FileName):
    access_file = open(FileName, "r")
    i = 1
    log_array=[]

    for line in access_file:

   		 try:
   	   if not "bot"in line:
   	  	if not "::1"in line: 		 
   		      	log_array.append(line[line.index("")+0:line.index("- -")])
   		 except:
   		   pass

    counter = collections.Counter(log_array)
    new_file=open("top10ip.txt",'w')
    new_file.write("No:    Count:     Domain name: \n")
    for count in counter.most_common(10):
   	 new_file.write(str(i) + "\t" + str(count[1]) + "\t" + str(count[0]))
   	 new_file.write('\n')
   	 i = i + 1
    
    access_file.close()
    new_file.close()

def Top10PDF(FileName):
    access_file = open(FileName, "r")
    i = 1
    log_array=[]

    for line in access_file:
   		 if ".pdf" in line:
   	  try:
   			log_array.append(line[line.index("GET")+4:line.index("HTTP")])
   		  except:
   			pass

    counter = collections.Counter(log_array)
    new_file = open("top10pdf.txt",'w')
    new_file.write("No:    Count:    PDF:")
    for count in counter.most_common(10):
   		 new_file.write(str(i) + "\t" + str(count[1]) + "\t" + str(count[0]))
   	 new_file.write('\n')
   	 i = i + 1

    access_file.close()
    new_file.close()

def TopIPV6(FileName):
    access_file = open(FileName, "r")
    i = 1
    log_array=[]

    for line in access_file:
     	if not "::1"in line:
   		 try:
   			log_array.append(line[line.index(":")-4:line.index("::")])
   		 except:
   			pass

    counter = collections.Counter(log_array)
    new_file = open("topIPv6.txt",'w')
    new_file.write("No:    Count:    IPV6:")
    for count in counter.most_common(4):
   		 new_file.write(str(i) + "\t" + str(count[1]) + "\t" + str(count[0]))
   	 new_file.write('\n')
   	 i = i + 1

    access_file.close()
    new_file.close()    
    
def top5Browsers(FileName):
      access_file = open(FileName, "r")
      log_array=[]
  		 
      i = 1
    
    for line in access_file:
    		 try:
   	 	if not "bot"in line:
   	   	if not "::1"in line: 	 
   		   	 log_array.append(line[line.index("(")-12:line.index(")")])
   		 
   		 except:
   			pass

    counter = collections.Counter(log_array)
    new_file = open("top5browsers.txt",'w')
    new_file.write("No:    Count:    Browser:")
    for count in counter.most_common(5):
   		 new_file.write(str(i) + "\t" + str(count[1]) + "\t" + str(count[0]))
   	 new_file.write('\n')   	 
   	 i = i + 1

    access_file.close()
    new_file.close()

def main():
    print("Script running....")
    Top10Domain(sys.argv[1])
    Top10IP(sys.argv[1])
    Top10PDF(sys.argv[1])
    TopIPV6(sys.argv[1])
    top5Browsers(sys.argv[1])    
    print("Script ended")

if __name__ == "__main__":
	main()
