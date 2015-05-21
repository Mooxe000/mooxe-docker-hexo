#!/usr/bin/env coffee

echo = console.log
require 'shelljs/make'

HOME = __dirname
DIR =
  src: "#{HOME}/src"
  build: "#{HOME}/build"
  dist: "#{HOME}/dist"
DIR.post = "#{DIR.build}/source/_posts"
DIR.public = "#{DIR.build}/public"
DIR.themes =
  target: "#{DIR.build}/themes"
  custom: "#{DIR.src}/themes"
DIR.blog = "#{DIR.src}/markdown/blog"
DIR.config =
  default: "#{DIR.build}/_config.yml"
  blog: "#{DIR.src}/config/blog.yml"

target.clean = ->
  rm '-rf', DIR.build
  rm '-rf', DIR.dist

target.hexo = ->
  exec 'hexo init build'
  # npm install
  cd DIR.build
  exec 'cnpm install'
  exec 'cnpm install hexo-tag-bootstrap --save'
  cd HOME
  # clean default article
  rm '-rf', "#{DIR.post}/*"
  # dm config
  # rm '-rf', DIR.config.default
  cp '-Rf', DIR.config.blog, DIR.config.default
  # dm article
  cp '-R', "#{DIR.blog}/*", DIR.post # blog :: design
  # dm theme
  cp '-R', "#{DIR.themes.custom}/*", DIR.themes.target

target.generate = ->
  cd DIR.build
  exec 'hexo generate'

target.dist = ->
  cp '-R', "#{DIR.public}/*", DIR.dist

target.server_build = ->
  cd DIR.build
  exec 'hexo server'

target.server_dist = ->
  cd HOME
  exec 'hs ./dist'

target.docker_build = ->
  cd HOME
  exec 'docker build -t mooxe/hexo ./'

target.all = ->
  target.clean()
  target.hexo()
  target.generate()
  target.dist()
