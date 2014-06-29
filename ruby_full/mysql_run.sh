#!/bin/sh

# prepare volume
test -z "$(ls /mysql)" && cp -r /var/lib/mysql/* /mysql
chown -R mysql:mysql /mysql

exec mysqld
