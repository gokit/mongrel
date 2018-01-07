FROM alpine:edge
MAINTAINER Ewetumo Alexander <trinoxf@gmail.com>

RUN apk update && apk upgrade
RUN apk add --no-cache mongodb && rm /usr/bin/mongoperf && rm -rf /var/cache/apk/*

# Create the db directory and expose it for usage.
# to add group: addgroup -S mariadb
# to add user: adduser -S mariadb
# RUN addgroup -S mongodb
# RUN adduser -S -g mongodb mongodb
RUN mkdir -p /data/db/mongodb/logs
RUN mkdir -p /etc/mongodb
RUN chown -R mongodb /etc/mongodb
RUN chown -R mongodb /data/db/mongodb
VOLUME /data/db/mongodb

# Copy mongodb configuration to the etc folder.
COPY conf/mongodb.cnf /etc/mongodb/mongodb.cnf
COPY conf/db.js /data/db/mongodb/db.js

EXPOSE 27017 28017

ENV MONGODB_PORT 27017

COPY ./bin/bootmgo /bin/bootmgo
RUN chmod +x /bin/bootmgo


