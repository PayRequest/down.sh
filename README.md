# down.sh
A simple bash script to check if websites are down and email if websites are down

##  Installguide
```
wget https://raw.githubusercontent.com/PayRequest/down.sh/master/down.sh
chmod a+x down.sh
./down.sh
```


## Features
- Check multiple domains
- Extra check after 5 minutes to eliminate false-positives
- Alerts via Email

## Roadmap
- Messagebird (SMS) & Slack alerts
- Systemd timer(s)
- Webhooks (HTTP Post)
- Alert when it is back online

