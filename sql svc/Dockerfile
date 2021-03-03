FROM alpine:3.12
RUN apk update
RUN apk upgrade
RUN apk add openrc sudo mysql mysql-client
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld
COPY srcs/my.cnf /etc/
COPY srcs/my.cnf /etc/mysql
COPY srcs/my.cnf /var/lib/mysql/

RUN chmod 777 /var/lib/mysql
RUN chown mysql /var/lib/mysql
COPY	./srcs/init_sql.sh /tmp

RUN	chmod +x /tmp/init_sql.sh
EXPOSE 3306
CMD	["/tmp/init_sql.sh"]
COPY srcs/my.cnf /etc/
COPY srcs/my.cnf /etc/mysql
COPY srcs/my.cnf /var/lib/mysql/