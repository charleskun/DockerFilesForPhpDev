FROM php:7.0-cli
MAINTAINER szb345@gmail.com
ENV WORK_HOME /home/swoole
RUN mkdir -p ${WORK_HOME}
ADD sources.list    /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
	zip \
	bzip2 \
    && docker-php-ext-install opcache \
    && docker-php-ext-install sockets \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && apt-get clean

ADD swoole-src-1.8.12-stable.tar.gz  ${WORK_HOME}
ADD phpredis-3.0.0.tar.gz  ${WORK_HOME}
ADD jemalloc-4.2.1.tar.bz2  ${WORK_HOME}
ADD hiredis-0.13.3.tar.gz  ${WORK_HOME}

RUN cd ${WORK_HOME} \
    && cd phpredis-3.0.0 \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install

RUN cd ${WORK_HOME} \
    && cd hiredis-0.13.3 \
	&& make -j install \
	&& ldconfig

RUN cd ${WORK_HOME} \
	&& cd jemalloc-4.2.1 \
	&& ./configure \
	&& make -j install \
	&& ldconfig

RUN cd ${WORK_HOME} \
	&& cd swoole-src-1.8.12-stable \
	&& phpize \
	&& ./configure --enable-async-redis --enable-jemalloc \
	&& make \
	&& make install

RUN cd ${WORK_HOME} \
    && cd phpredis-3.0.0 \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install

RUN docker-php-ext-enable redis && docker-php-ext-enable swoole

WORKDIR /opt

EXPOSE 88
EXPOSE 9503
VOLUME ["/opt"]

CMD php /opt/web/k12_swoole/docker_server.php
#CMD php /opt/web/k12_swoole/im_server.php