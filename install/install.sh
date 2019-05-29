#!/bin/sh 

#Nginx
cp /sdcard/geopoppy/install/default /etc/nginx/sites-enabled/default
        
#PHP-FPM
cp /sdcard/geopoppy/install/php.ini /etc/php/7.3/fpm/php.ini
#ln -s /usr/lib/libc-client.a /usr/lib/aarch64-linux-gnu/libc-client.a
#ln -s /usr/lib/libc-client.a /usr/lib/arm-linux-gnueabihf/libc-client.a

#start nginx +phpfpm
sudo service nginx start
sudo service php7.3-fpm start

#lizmap
#lizmap_version=3.2.3
#lizmap_git=https://github.com/3liz/lizmap-web-client.git
#git clone --branch $lizmap_version --depth=1  $lizmap_git lizmap &&

VERSION=3.2.3
lizmap_wps_version=master
lizmap_wps_git=https://github.com/3liz/lizmap-wps-web-client-module.git 
mkdir /www
cd /www
wget https://github.com/3liz/lizmap-web-client/archive/$VERSION.zip
unzip $VERSION.zip
rm $VERSION.zip
ln -s /www/lizmap-web-client-$VERSION/lizmap/www/ /www/lizmap

git clone --branch $lizmap_wps_version --depth=1 $lizmap_wps_git lizmap-wps
mv lizmap-wps/wps /www/lizmap-web-client-$VERSION/lizmap/lizmap-modules/wps
rm -rf lizmap-wps

cd /www/lizmap-web-client-$VERSION
cp /sdcard/geopoppy/install/lizmapConfig.ini.php lizmap/var/config/lizmapConfig.ini.php
cp /sdcard/geopoppy/install/localconfig.ini.php lizmap/var/config/localconfig.ini.php
cp lizmap/var/config/profiles.ini.php.dist     lizmap/var/config/profiles.ini.php
php lizmap/install/installer.php
sudo sh lizmap/install/set_rights.sh www-data www-data
sh lizmap/install/clean_vartmp.sh
cd

#py-qgis-server
git_repository=https://github.com/3liz/py-qgis-server.git
git_branch=master
git clone --branch $git_branch --depth=1 $git_repository py-qgis-server
make -C py-qgis-server dist
sudo pip3 install py-qgis-server/build/dist/*.tar.gz
rm -rf py-qgis-server && rm -rf /root/.cache /root/.ccache

#wps
wps_branch=master
wps_repository=https://github.com/3liz/py-qgis-wps.git
api_branch=master
api_repository=https://github.com/dmarteau/lizmap-plugin.git
git clone --branch $api_branch --depth=1 $api_repository lizmap-plugin
cd lizmap-plugin 
sudo pip3 install .
cd ..
rm -rf lizmap-plugin
rm -rf /root/.cache /root/.ccache
git clone --branch $wps_branch --depth=1 $wps_repository py-qgis-wps
sudo make -C py-qgis-wps dist
sudo pip3 install py-qgis-wps/build/dist/*.tar.gz
cp py-qgis-wps/factory.manifest /build.manifest
rm -rf py-qgis-wps
rm -rf /root/.cache /root/.ccache




#postgresql
cp /sdcard/geopoppy/install/postgresql.conf /etc/postgresql/9.6/main/
cp /sdcard/geopoppy/install/pg_hba.conf /etc/postgresql/9.6/main/

service postgresql restart

      # Creating a "superuser" user
      su - postgres
      createuser geopoppy --superuser
      # Modifying passwords
      psql
      ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres';
      ALTER USER geopoppy WITH ENCRYPTED PASSWORD 'geopoppy';
      \q
      createdb template_postgis -E UTF8 -T template0;

      psql template_postgis 
      CREATE EXTENSION postgis;
      CREATE EXTENSION hstore;
      CREATE EXTENSION postgis_topology;
      \q

      createdb -O geopoppy -T template_postgis geopoppy;
      psql -U postgres -d geopoppy -f /sdcard/geopoppy/db/geopoppy.sql
      \q
      exit















