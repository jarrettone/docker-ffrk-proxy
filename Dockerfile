FROM ficusio/node-alpine
MAINTAINER Julien Del-Piccolo <moi@jdel.org>

RUN \
  wget https://github.com/ThauEx/ffrk-proxy/archive/0.8.0.tar.gz -O - | gunzip | tar -xf - -C / && \
  mv ffrk-proxy-0.8.0 ffrk

WORKDIR /ffrk

RUN \
  npm install

EXPOSE ${proxy_port:-5050}
EXPOSE ${cert_port:-5051}

ADD config/default.yml config/

CMD node bin/app.js --config ${config:-default}
