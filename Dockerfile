FROM alpine:3.12

#RUN echo -e "http://nl.alpinelinux.org/alpine/v3.5/main\nhttp://nl.alpinelinux.org/alpine/v3.5/community" > /etc/apk/repositories

RUN	apk update
RUN	apk add nginx openssl openssh supervisor

# add user supervisor
# RUN adduser 1
# RUN echo 1

COPY	./srcs/nginx_conf /etc/nginx/conf.d/default.conf
RUN	mkdir /etc/nginx/ssl
RUN	openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj "/C=RU/#ST=Kazan/L= Kazan/O=21 School/OU=cveeta/CN= cveeta"

COPY	./srcs/supervisord.conf /etc/supervisord.conf
COPY	./srcs/init.sh /tmp/

RUN	chmod +x /tmp/init.sh
RUN	mkdir -p /run/nginx
EXPOSE 80 443 22

CMD	["/tmp/init.sh"]