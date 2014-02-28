grep ".pdf" access.log.10 > pdf_requests.tmp
cat pdf_requests.tmp | cut -f 2 -d '"' > get_pdf.tmp
cat get_pdf.tmp | cut -f 2 -d ' ' > just_pdf.tmp
cat just_pdf.tmp | uniq  -c > just_pdf_uniq.tmp
cat just_pdf_uniq.tmp | sort -nr | head  


