/usr/sbin/mysqld &
sleep 3
mysql -p --execute="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
