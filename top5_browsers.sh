grep "GET" $1 > get_only.tmp
cat get_only.tmp | cut -f 6 -d '"' > get_browsers.tmp
cat get_browsers.tmp | uniq  -c > get_browsers_uniq.tmp
cat get_browsers_uniq.tmp | sort -nr | head 
