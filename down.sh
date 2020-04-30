#!/bin/bash

# Settings
email=`your@email.com'`

# Down.sh lets you check your websites if they are online
# Websites you want to check
urls=(
  http://www.yourdomain.com
  https://www.website.com
)

for url in "${urls[@]}"
do
  /usr/bin/wget --server-response -O /dev/null $url > /dev/null 2> /dev/null
  if [ $? -ne 0 ]
  then
    # Full URLs can disappear in text messages. Extract the domain and use that
    # for all error reporting instead.
    domain=`echo $url | awk -F/ '{print $3} down'`

    # Wait 5 minutes to eliminate false positives.
    echo "$domain seems to be down. Waiting 5 minutes."
    sleep 300

    /usr/bin/wget --server-response -O /dev/null $url > /dev/null 2> /dev/null
    if [ $? -ne 0 ]
    then
      echo "$domain still down. Sending email to $email ."
      echo "$domain down" | /usr/sbin/sendmail $email
    fi
  fi
done
