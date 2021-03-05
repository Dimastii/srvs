FROM alpine:3.12.3

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

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm -f latest.tar.gz
RUN mv wordpress /etc/


RUN mkdir -p /etc/wordpress/tmp
RUN chmod 777 /etc/wordpress/tmp
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/run/php

RUN rm etc/nginx/conf.d/default.conf
COPY ./srcs/nginx.conf etc/nginx/conf.d/

COPY ./srcs/supervisord.conf /etc/supervisord.conf

RUN rm /etc/wordpress/wp-config-sample.php
COPY	./srcs/wp-config-sample.php /etc/wordpress

COPY	./srcs/init_word.sh /tmp/
RUN	chmod +x /tmp/init_word.sh
EXPOSE 5050

CMD	["/tmp/init_word.sh"]