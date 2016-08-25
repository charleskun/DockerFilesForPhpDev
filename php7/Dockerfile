FROM php:7.0-fpm
MAINTAINER k12-PHP "fengkun0423@gmail.com"

ADD sources.list    /etc/apt/sources.list
# 安装modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        && docker-php-ext-install -j$(nproc) iconv mcrypt \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install mysqli


RUN  apt-get update && pecl install redis \
     && docker-php-ext-enable redis


ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf

WORKDIR /opt

RUN usermod -u 1000 www-data

EXPOSE 9000
VOLUME ["/opt"]
