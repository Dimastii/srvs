#!/bin/sh

#ssh-keygen -A

#/usr/sbin/sshd -D
rc default
sudo mkdir /var/run/mysqld
sudo mkfifo /var/run/mysqld/mysqld.sock
sudo chown -R mysql /var/run/mysqld
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE DB;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON DB.* TO 'admin';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
mysql -uroot DB < DB.sql

/etc/init.d/mariadb stop
exec /usr/bin/mysqld_safe
