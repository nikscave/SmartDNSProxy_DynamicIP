# SmartDNSProxy_DynamicIP
Cron job to update your SmartDNSProxy IP address if you only have dynamic IP, like me!

### Install

1. edit cron.sh with your [smartdnsproxy API details](https://www.smartdnsproxy.com/MyAccount/API?afid=cfd2443ce6b0)
2. edit cron.sh as appropriate depending on which location you are storing the script in. if not editing, save copy in /tmp/smartdns
3. On initial run current.txt and new.txt need to be created e.g. echo your.ip.address.here > current.txt (and the same for new.txt)
4. add script to crontab (amend from sh to bash depending on your shell used, I have this running on my OpenWRT router so its sh)
> */5 * * * * sh /tmp/smartdns/cron.sh
5. start/restart your cron service depending if running already or not
> /etc/init.d/cron start  
> /etc/init/d/cron restart
6. Every 5 mins the script will run and update your active IP to smartdnsproxy if its changed.
