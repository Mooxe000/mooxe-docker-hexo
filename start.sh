#!/bin/bash

app='/root/mooxe-docker-hexo/bin/hexo.pm2.json'

/bin/bash /root/.nvm/nvm.sh
/bin/bash -l -c 'git pull'
/bin/bash -l -c 'pm2 dump'
/bin/bash -l -c "pm2 startOrRestart ${app}"

while true
do
  sleep 1d
done
