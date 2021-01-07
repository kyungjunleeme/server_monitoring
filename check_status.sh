Last login: Wed Jan  6 16:59:38 on ttys000
 ~  ssh inhandplus@121.134.241.239 -p 322                    ✔  07:59:00 PM
Last login: Wed Jan  6 17:48:06 2021 from 192.168.25.1
(base) inhandplus@local:~$ conda deactiavte

CommandNotFoundError: No command 'conda deactiavte'.
Did you mean 'conda deactivate'?

(base) inhandplus@local:~$ conda deacitavte

CommandNotFoundError: No command 'conda deacitavte'.
Did you mean 'conda deactivate'?

(base) inhandplus@local:~$ conda deactivate
inhandplus@local:~$ ls
201231_231010_D1013E11E996.mp4  anaconda3        ml
Desktop                         check_status.sh  models
Documents                       cocoapi          object-detection-training
Downloads                       dockertest       object_detection_models
action_recognition_models       kafka-test.py    prod.py
add                             labelImg         saved_model.pb
ai-server-v2                    medication       webhook_server
inhandplus@local:~$ cd webhook_server/
inhandplus@local:~/webhook_server$ ls
201231_231010_D1013E11E996.mp4  check_status.sh
inhandplus@local:~/webhook_server$ pwd
/home/inhandplus/webhook_server
inhandplus@local:~/webhook_server$ ls
201231_231010_D1013E11E996.mp4  check_status.sh
inhandplus@local:~/webhook_server$ cat check_status.sh
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
url="https://discord.com/api/webhooks/795931144943829002/oZAwAzVO4qXqgonSYFKdcEi8iF3vQ8he9Lp-tMvyWXUZopX04qKlMxD__jxdO2wfRm4u"

##
# List of websites to check
# To add more websites just use space as a separator, for example:
# websites_list="your_domain1 your_domain2 your_domain3"
##
websites_list="http://api.inhandplus.com/smartwatchdata"

for website in ${websites_list} ; do
        status_code=$(curl -X POST -F 'guid=20IHPA00130A' -F 'filePath=2020-12-31/20IHPA00130A_201231_231010_D1013E11E996.mp4' -F 'file=@201231_231010_D1013E11E996.mp4' --write-out %{http_code} --silent --output /dev/null -L ${website})
        if [[ "$status_code" -eq 201 ]] ; then
            # POST request to Discord Webhook with the domain name and the HTTP status code
            echo "${website} is running:${status_code}"
            curl -H "Content-Type: application/json" -X POST -d '{"content":"'"${website} : ${status_code}"'"}'  $url
        else
            echo "${website} has something wrong:${status_code}"
            curl -H "Content-Type: application/json" -X POST -d '{"content":"'"${website} : ${status_code}"'"}'  $url
        fi
inhandplus@local:~/webhook_server$
inhandplus@local:~/webhook_server$ exit
logout
Connection to 121.134.241.239 closed.

 ~  ls                                              ✔  8m 24s  08:07:28 PM
Applications             Google Drive File Stream Pictures
Desktop                  Library                  Postman
Documents                Movies                   Public
Downloads                Music                    git_project
 1 check_status.sh                                                   Buffers
 21 # Change the 'your_discord_webhook_name' with your actual Discord Webhook
 20 ##
 19 url="https://discord.com/api/webhooks/795931144943829002/oZAwAzVO4qXqgonSYFK
 18
 17 ##
 16 # List of websites to check
 15 # To add more websites just use space as a separator, for example:
 14 # websites_list="your_domain1 your_domain2 your_domain3"
 13 ##
 12 websites_list="ask kyungjun"
 11
 10 for website in ${websites_list} ; do
  9   ┊ ┊ ┊ status_code=$(curl -X POST -F 'guid=20IHPA00130A' -F 'filePath=2020-
  8   ┊ ┊ ┊ if [[ "$status_code" -eq 201 ]] ; then
  7   ┊ ┊ ┊ ┊ ┊ # POST request to Discord Webhook with the domain name and the H
  6   ┊ ┊ ┊ ┊ ┊ echo "${website} is running:${status_code}"
  5   ┊ ┊ ┊ ┊ ┊ curl -H "Content-Type: application/json" -X POST -d '{"content":
  4   ┊ ┊ ┊ else
  3   ┊ ┊ ┊ ┊ ┊ echo "${website} has something wrong:${status_code}"
  2   ┊ ┊ ┊ ┊ ┊ curl -H "Content-Type: application/json" -X POST -d '{"content":
  1   ┊ ┊ ┊ fi
31    ┊ ┊
 INSERT 1  * check_status.sh  sh  ❖ ⓢ                   | utf-8   31:  7

