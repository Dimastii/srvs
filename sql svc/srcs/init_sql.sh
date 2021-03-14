#!/bin/sh

rc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE DB;
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON DB.* TO 'root';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

mysql -uroot DB < DB.sql

/etc/init.d/mariadb stop

"/usr/bin/supervisord", "-c", "/etc/supervisord.conf"

exec /usr/bin/mysqld_safe