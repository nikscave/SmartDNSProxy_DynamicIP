#!/bin/sh
set -e # exit script should anything error, mainly curl timeout
CURL='/usr/bin/curl'
RVMHTTP="--max-time 5 https://ifconfig.me" #timeouts after 5 seconds should the API not respond. Dont hit the service more than once per minute
API="https://www.smartdnsproxy.com/api/IP/update/xxxxxxxxxxxx" #replace xxx with your API key from https://www.smartdnsproxy.com/MyAccount/API?afid=cfd2443ce6b0
current=`cat /tmp/smartdns/current.txt`
new="$($CURL $RVMHTTP)"
echo "$new" > "/tmp/smartdns/new.txt"
checkNew=`cat /tmp/smartdns/new.txt`

if [ $current == $checkNew ]
then
        echo "no change to IP"
else
        #echo "different"
        cp /tmp/smartdns/new.txt /tmp/smartdns/current.txt
        $CURL $API #IP has changed in last 5 mins, update smartdnsproxy via API call
fi
