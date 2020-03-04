#!/bin/sh

CURL='/usr/bin/curl'
RVMHTTP="--max-time 5 https://ifconfig.me"
API="https://www.smartdnsproxy.com/api/IP/update/xxxxxxxxxxxx" #replace xxx with your API key from https://www.smartdnsproxy.com/MyAccount/API?afid=cfd2443ce6b0
#current=$(</tmp/smartdns/current.txt)
current=`cat /tmp/smartdns/current.txt`
new="$($CURL $RVMHTTP)"
echo "$new" > "/tmp/smartdns/new.txt"
checkNew=`cat /tmp/smartdns/new.txt`
#checkNew=$(</tmp/smartdns/current.txt)
#echo $current;echo " - "; echo $checkNew;

if [ $current == $checkNew ]
then
        echo "no change to IP"
else
        #echo "different"
        cp /tmp/smartdns/new.txt /tmp/smartdns/current.txt
        $CURL $API
fi
