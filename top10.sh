# This is only one suggested solution
# Extract all http GET commands and store in a temporary file
grep "GET " $1  > get_requests.tmp
# get all of the ip addresses that issued a "GET"
cat get_requests.tmp | cut -f 1 -d ' ' > ip_addr_get.tmp
# Sort all "GET"ers
cat ip_addr_get.tmp | sort > ip_addr_get_sorted.tmp 
# get uniq 
cat ip_addr_get_sorted.tmp | uniq  -c > ip_addr_get_sorted_uniq.tmp
# sort top and extract top 10
cat ip_addr_get_sorted_uniq.tmp | sort -nr | head | cut -f 5 -d ' ' | \
while read hostip; do
	echo $hostip
	#whois -H $hostip | grep -i netname | cut -f 2 -d ':'
done
# clean up temporary files.  Remove this for degugging if necessary
rm *.tmp
