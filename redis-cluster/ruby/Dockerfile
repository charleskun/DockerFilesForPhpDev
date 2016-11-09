FROM ruby:2.2.5
MAINTAINER k12-RUBY "fengkun0423@gmail.com"

RUN gem install redis
RUN curl -s http://download.redis.io/releases/redis-3.0.7.tar.gz | tar -xz -C /usr/local
RUN cd /usr/local && ln -s redis-3.0.7 redis


