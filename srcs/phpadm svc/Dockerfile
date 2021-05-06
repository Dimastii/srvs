FROM alpine:3.12.3

#   install the necessary utilities
RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add sudo
RUN apk add openssl
RUN apk add openrc
RUN apk add supervisor
RUN apk add wget
RUN apk add vim
RUN apk add nginx
RUN apk add php7
RUN apk add php7-fpm
RUN apk add php7-opcache
RUN apk add php7-gd
RUN apk add php7-iconv
RUN apk add php7-mysqli
RUN apk add php7-mbstring
RUN apk add php7-json
RUN apk add php7-session



ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz /
RUN tar -xzvf phpMyAdmin-5.0.4-english.tar.gz
RUN rm -f phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english /etc/phpMyAdmin
RUN mkdir -p /var/run/php
RUN mkdir -p /etc/phpMyAdmin/tmp
RUN chmod 777 /etc/phpMyAdmin/tmp

#   nginx
RUN mkdir -p /var/run/nginx
# RUN touch /var/run/nginx/nginx.pid
RUN rm etc/nginx/conf.d/default.conf
COPY ./srcs/nginx.conf etc/nginx/conf.d/

#   copy default config
COPY ./srcs/config.inc.php /etc/phpMyAdmin/

#   supervisord
COPY ./srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 5000

#   supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]