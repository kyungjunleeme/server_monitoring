#!/bin/bash
##
# api server monitoring script
# Author: Kyungjunlee
# Date: 01/06/2021
##

##
# Discord webhook
# Change the 'your_discord_webhook_name' with your actual Discord Webhook
##
url="Ask Kyungjun because of security"

##
# List of websites to check
# To add more websites just use space as a separator, for example:
# websites_list="your_domain1 your_domain2 your_domain3"
# curl -X POST --data-urlencode "payload={\"channel\": \"#sever_monitoring\", \"username\": \"Monitoring_alert\", \"text\": \"${website} is running:${status_code}\", \"icon_emoji\": \":ghost:\"}" $url

websites_list="Ask Kyungjun because of security"

for website in ${websites_list} ; do
        status_code=$(curl -X POST -F 'guid=20IHPA00130A' -F 'filePath=2020-12-31/20IHPA00130A_201231_231010_D1013E11E996.mp4' -F 'file=@201231_231010_D1013E11E996.mp4' --write-out %{http_code} --silent --output /dev/null -L ${website})
        if [[ "$status_code" -eq 201 ]] ; then
            # POST request to Discord Webhook with the domain name and the HTTP status code
            echo "${website} is running:${status_code}"
            curl -X POST --data-urlencode "payload={\"channel\": \"#sever_monitoring\", \"username\": \"Monitoring_alert\", \"text\": \"${website} is running:${status_code}\", \"icon_emoji\": \":ghost:\"}" --silent --output /dev/null -L $url
        else
            echo "${website} has something wrong:${status_code}"
            curl -X POST --data-urlencode "payload={\"channel\": \"#sever_monitoring\", \"username\": \"Monitoring_alert\", \"text\": \"${website} has something wrong:${status_code}\", \"icon_emoji\": \":ghost:\"}" --silent --output /dev/null -L $url
        fi
done