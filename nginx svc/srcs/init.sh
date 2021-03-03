#!/bin/sh

ssh-keygen -A

#nginx -g 'daemon off;'

#/usr/sbin/sshd -D

/usr/bin/supervisord -c /etc/supervisord.conf