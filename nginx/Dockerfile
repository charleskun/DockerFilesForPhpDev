FROM nginx:1.10.1

MAINTAINER k12-NGINX "fengkun0423@gmail.com"


ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  locations.conf      /etc/nginx/locations.conf
ADD  sites-enabled/*    /etc/nginx/conf.d/
RUN  mkdir /opt/web && mkdir /opt/log && mkdir /opt/log/nginx
RUN  chown -R www-data.www-data /opt/web /opt/log
RUN  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
EXPOSE 80
VOLUME ["/opt"]

