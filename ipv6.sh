FILE='ipv6.tmp'

grep "::" $1 > $FILE
cut -d ' ' -f 1 $FILE |sort > ipv6raw.tmp 

 for ip in `cat $FILE |cut -d ' ' -f 1 |sort |uniq`;
 do { 
  	COUNT=`grep ^$ip $FILE |wc -l`;
 	echo "$COUNT:   $ip" >> ipv6new.tmp
}; 	done
 

