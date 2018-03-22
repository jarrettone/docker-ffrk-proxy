FROM node:alpine
LABEL maintainer="Julien Del-Piccolo <julien@del-piccolo.com>"

ARG FFRK_PROXY_VERSION=${FFRK_PROXY_VERSION:-master}

RUN apk update \
 && apk add --no-cache ca-certificates curl \
 && apk upgrade \
 && rm -rf /var/cache/apk/* \
 && curl -L https://github.com/ThauEx/ffrk-proxy/archive/${FFRK_PROXY_VERSION}.tar.gz | gunzip | tar -xf - -C / \
 && mv /ffrk-proxy-${FFRK_PROXY_VERSION} /ffrk

WORKDIR /ffrk

RUN npm install

EXPOSE ${proxy_port:-5050}
EXPOSE ${cert_port:-5051}

COPY config/default.yml config/

CMD npm run-script start -- --config ${config:-default} --port ${proxy_port:-5050} --cert-port ${cert_port:-5051}
