FROM php:5.6-fpm
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
        && docker-php-ext-install -j$(nproc) gd


# 安装 PHP extensions
COPY redis.tgz /home/redis.tgz
COPY xdebug.tgz /home/xdebug.tgz

RUN  pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
     && pecl install /home/xdebug.tgz && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini \
      && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
      && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
      && echo "xdebug.remote_host=192.168.123.57" >> /usr/local/etc/php/conf.d/xdebug.ini

ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf

WORKDIR /opt

RUN usermod -u 1000 www-data

EXPOSE 9000
VOLUME ["/opt"]
