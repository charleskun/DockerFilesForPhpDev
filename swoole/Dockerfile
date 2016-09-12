FROM php:7.0-cli
MAINTAINER szb345@gmail.com
ENV WORK_HOME /home/swoole
RUN mkdir -p ${WORK_HOME}
ADD sources.list    /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
	zip \
	bzip2

COPY swoole-src-1.8.10-stable.tar.gz  ${WORK_HOME}/swoole-src-1.8.10-stable.tar.gz
COPY phpredis-3.0.0.tar.gz  ${WORK_HOME}/phpredis-3.0.0.tar.gz
COPY jemalloc-4.2.1.tar.bz2  ${WORK_HOME}/jemalloc-4.2.1.tar.bz2

RUN cd ${WORK_HOME} \
	&& tar -xjf jemalloc-4.2.1.tar.bz2 \
	&& cd jemalloc-4.2.1 \
	&& ./configure \
	&& make -j install \
	&& ldconfig

RUN cd ${WORK_HOME} \
	&& tar zxvf swoole-src-1.8.10-stable.tar.gz \
	&& cd swoole-src-1.8.10-stable \
	&& phpize \
	&& ./configure --enable-jemalloc \
	&& make \
	&& make install

RUN cd ${WORK_HOME} \
	&& tar zxvf phpredis-3.0.0.tar.gz \
    && cd phpredis-3.0.0 \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install

RUN docker-php-ext-enable redis && docker-php-ext-enable swoole && docker-php-ext-install mysqli

WORKDIR /opt

EXPOSE 88
VOLUME ["/opt"]

COPY server.php .
CMD php server.php
#CMD php /opt/web/k12_swoole/webim_server.php