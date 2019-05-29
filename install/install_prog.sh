#!/bin/sh 

sudo apt-get update &&
sudo apt-get install -f -y -t stretch postgresql postgresql-contrib postgis --fix-missing &&

sudo echo "deb    http://http.debian.net/debian sid main " >> /etc/apt/sources.list &&
sudo apt-get update &&

sudo apt-get install -t sid -y wget \
                              curl \
                              nano \
                              git \
                              unzip \
                              build-essential \
                              apt-utils \
                              software-properties-common \
                              php7.3 php7.3-fpm php7.3-cli php7.3-mysql php7.3-gd php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-cgi php7.3-sqlite php7.3-curl \
                              php7.3-bcmath php7.3-dev php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring php7.3-zip php7.3-pgsql php7.3-intl php7.3-xml \
                              php7.3-redis \
                              libfcgi-dev libfcgi0ldbl libjpeg62-turbo-dev libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev \
                              libjpeg-dev libpng-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev libffi-dev \
                              libc6-dev-arm64-cross libc6-dev-armhf-cross \
                              nginx \
                              python-simplejson \
                              python-pip \
                              python3-pip \
                              python-setuptools \
                              python3-dev \
                              python3-qgis \
                              python3-wheel \
                              python3-lxml \
                              python3-psutil \
                              qgis-server \
                              xvfb \
                              libzmq5 \
                              redis-server \
                              lftp \
                              make \
                              gosu \
                              --fix-missing
