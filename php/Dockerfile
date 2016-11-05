FROM php:7.0-fpm
MAINTAINER k12-PHP "fengkun0423@gmail.com"

ADD sources.list    /etc/apt/sources.list
# 安装modules
RUN apt-get update && apt-get install -y \
        #libxml2-dev \
        libfreetype6-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        unzip \
        && docker-php-ext-install -j$(nproc) iconv mcrypt \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install opcache \
        #&& docker-php-ext-install zip \
        && pecl install redis \
        && docker-php-ext-enable redis \
        && apt-get clean

ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf
ADD cphalcon-3.0.1.tar.gz /home/


RUN cd /home/cphalcon-3.0.1/build && ./install

RUN docker-php-ext-enable phalcon

WORKDIR /opt

RUN usermod -u 1000 www-data
RUN  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
EXPOSE 9000
VOLUME ["/opt"]
