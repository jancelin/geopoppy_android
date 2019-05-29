#!/bin/sh 

service postgresql start &&
service nginx restart &&
sudo service php7.3-fpm restart &&

qgisserver -c /sdcard/geopoppy/conf/qgisserver.conf --rootdir /
#wpsserver --logging debug -b 127.0.0.1 -p 8081 -w 1 --chdir /sdcard/geopoppy/processing/
#sudo redis-server /etc/redis/redis.conf
