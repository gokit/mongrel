FROM alpine:edge
MAINTAINER Ewetumo Alexander <trinoxf@gmail.com>

RUN apk update && apk upgrade
RUN apk add --no-cache mongodb go && rm /usr/bin/mongoperf && rm -rf /var/cache/apk/*

# Create the db directory and expose it for usage.
# to add group: groupadd --system mongodb
RUN mkdir -p /mnt/db/mongodb
RUN mkdir -p /etc/mongodb
RUN chown -R mongodb /etc/mongodb
RUN chown -R mongodb /mnt/db/mongodb
VOLUME /mnt/db/mongodb

# Copy mongodb configuration to the etc folder.
COPY conf/mongodb.cnf /etc/mongodb/mongodb.cnf

EXPOSE 27017 28017

ENV MONGODB_PORT 27017

COPY ./bin/bootmgo /bin/bootmgo
RUN chmod +x /bin/bootmgo


