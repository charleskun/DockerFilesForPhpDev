FROM redis:3.0

MAINTAINER k12-REDIS "fengkun0423@gmail.com"


COPY redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

VOLUME ["/opt"]
EXPOSE 6379


