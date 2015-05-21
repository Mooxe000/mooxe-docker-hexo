#!/usr/bin/env coffee

echo = console.log
require 'shelljs/make'

target.build = ->
  exec 'docker build --rm -t mooxe/hexo ./'

target.stop_all = ->
  exec './stopall.py'

target.in = ->
  echo 'docker run -t -i -p 80:3000 mooxe/hexo /bin/bash'

target.run = ->
  # exec 'docker run --name nginx -d -p 80:3000 mooxe/base'
  # exec 'docker run -t -i -p 80:3000 mooxe/hexo /bin/bash'
  exec 'docker run -d -p 80:3000 mooxe/hexo'

target.clean = ->
  exec 'docker rm $(docker ps -a -q)'
  exec 'docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'

target.all = ->
  echo 'hello'
