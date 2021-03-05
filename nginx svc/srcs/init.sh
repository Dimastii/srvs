#!/bin/sh

ssh-keygen -A

#nginx.conf -g 'daemon off;'

#/usr/sbin/sshd -D

/usr/bin/supervisord -c /etc/supervisord.conf