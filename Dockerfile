FROM mooxe/node

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

RUN \

  # npm install
  /bin/bash -l -c 'cnpm install -g hexo-cli' && \

  # git clone
  git clone https://github.com/Mooxe000/mooxe-docker-hexo.git

WORKDIR /root/mooxe-docker-hexo

# npm install
RUN \

  git submodule init && \
  git submodule update && \
  /bin/bash -l -c 'cnpm install' && \
  /bin/bash -l -c 'npm run build'

CMD ["/root/mooxe-docker-hexo/start.sh"]

EXPOSE 3000
