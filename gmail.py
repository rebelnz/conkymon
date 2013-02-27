import os 
import string 

# CAUTION... sensitive data...

username="XXXX" 
password="XXXX" 

com="wget -O - https://"+username+":"+password+"@mail.google.com/mail/feed/atom --no-check-certificate" 

temp=os.popen(com) 
msg=temp.read() 
index=string.find(msg,"<fullcount>") 
index2=string.find(msg,"</fullcount>") 
fc=int(msg[index+11:index2]) 


if fc==0: 
    print "0" 
if fc>0: 
    print str(fc)
