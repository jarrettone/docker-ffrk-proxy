FROM node:alpine
LABEL maintainer="Julien Del-Piccolo <julien@del-piccolo.com>"

RUN apk update \
 && apk add --no-cache ca-certificates curl \
 && apk upgrade \
 && rm -rf /var/cache/apk/* \
 && curl -L https://github.com/ThauEx/ffrk-proxy/archive/0.10.0.tar.gz | gunzip | tar -xf - -C / \
 && mv /ffrk-proxy-0.10.0 /ffrk

WORKDIR /ffrk

RUN npm install

EXPOSE ${proxy_port:-5050}
EXPOSE ${cert_port:-5051}

ADD config/default.yml config/

CMD node bin/app.js --config ${config:-default} --port ${proxy_port:-5050} --cert-port ${cert_port:-5051}
