# Docker container paracamplus/moocjs

FROM node
LABEL maintainer="Christian.Queinnec@CodeGradX.org"

RUN apt-get update && \
    apt-get install -y rsync && \
    apt-get clean

WORKDIR /tmp
COPY package.json .
RUN npm install && \
    rsync -avu /tmp/node_modules/ /usr/local/lib/node_modules/ && \
    rm -rf /tmp/node_modules

COPY start.sh /tmp/
WORKDIR /usr/src/app
ENTRYPOINT [ "/tmp/start.sh" ]

