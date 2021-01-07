#!/bin/bash
##
# api server monitoring script
# Author: Kyungjunlee
# Date: 01/06/2021
##
# from https://blog.lael.be/post/7264
# from https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for-your-website-status-on-ubuntu-18-04
##
# Discord webhook
##
url="https://discord.com/api/webhooks/795931144943829002/oZAwAzVO4qXqgonSYFKdcEi8iF3vQ8he9Lp-tMvyWXUZopX04qKlMxD__jxdO2wfRm4u"

##
# List of websites to check
# To add more websites just use space as a separator, for example:
# websites_list="your_domain1 your_domain2 your_domain3"
##
websites_list="Ask Kyungjun because of security"

for website in ${websites_list} ; do
        # curl 옵션 가운데 --silent --output /dev/null 를 이용해서 output 을 http_code만 추출할 수 있도록 처리함
        status_code=$(curl -X POST -F 'guid=20IHPA00130A' -F 'filePath=2020-12-31/20IHPA00130A_201231_231010_D1013E11E996.mp4' -F 'file=@201231_231010_D1013E11E996.mp4' --write-out %{http_code} --silent --output /dev/null -L ${website})
        # 201 경우 서버가 정상작동하고 있다는 것임
        if [[ "$status_code" -eq 201 ]] ; then
            # POST request to Discord Webhook with the domain name and the HTTP status code
            echo "${website} is running:${status_code}"
            curl -H "Content-Type: application/json" -X POST -d '{"content":"'"${website} : ${status_code}"'"}'  $url
        # 201이 아닐 경우 서버가 정상작동하지 않는 것을 의미함
        else
            echo "${website} has something wrong:${status_code}"
            curl -H "Content-Type: application/json" -X POST -d '{"content":"'"${website} : ${status_code}"'"}'  $url
        fi
done