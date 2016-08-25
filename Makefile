dl:
	wget https://pecl.php.net/get/redis-2.2.7.tgz -O php/redis.tgz
	wget https://pecl.php.net/get/memcached-2.2.0.tgz -O php/memcached.tgz
	wget https://pecl.php.net/get/xdebug-2.3.2.tgz -O php/xdebug.tgz
	wget https://pecl.php.net/get/memcache-2.2.7.tgz -O php/memcache.tgz
	wget https://getcomposer.org/composer.phar -O php/composer.phar

build:
	make build-php
	make build-nginx

build-nginx:
	docker build -t k12/nginx ./nginx

run-nginx:
	docker run -i -d -p 80:80 -v ~/Work:/opt/web -t k12/nginx

in-nginx:
	docker run -i -p 80:80 -v ~/Work:/opt/web -t k12/nginx /bin/bash

build-php:
	docker build -t k12/php ./php7

run-php:
	docker run -i -d -p 9000:9000 -v ~/Work:/opt/web -t k12/php

in-php:
	docker run -i -p 9000:9000 -v ~/Work:/opt/web -t k12/php /bin/bash

build-mysql:
	docker build -t k12/mysql ./mysql

run-mysql:
	docker run -i -d -p 3306:3306 -v /opt/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t k12/mysql

in-mysql:
	docker run -i -p 3306:3306  -v /data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t k12/mysql /bin/bash

clean:
	docker rmi -f $(docker images -q -a)