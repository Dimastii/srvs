FROM alpine:3.12
RUN apk update
RUN apk upgrade
RUN apk add openrc sudo mysql mysql-client supervisor
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld

COPY srcs/my.cnf /etc/mysql

COPY dddbbb.sql /

RUN chmod -R 755 /dddbbb.sql

RUN chmod 777 /var/lib/mysql
RUN chown mysql /var/lib/mysql
COPY	./srcs/init_sql.sh /tmp

COPY ./telegraf.conf etc/telegraf

VOLUME ["/var/lib/mysql"]

RUN	chmod +x /tmp/init_sql.sh
EXPOSE 3306
CMD	["/tmp/init_sql.sh"]
