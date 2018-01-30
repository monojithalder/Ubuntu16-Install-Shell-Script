#!/usr/bin/env bash
PHP_VERSION='7.1'
MYSQL_VERSION='5.7'
PASSWORD=''
GIT_NAME=''
GIT_EMAIL=''


echo $PASSWORD | sudo -S apt-get update

#Install apache2 
echo $PASSWORD | sudo -S apt-get install apache2
echo $PASSWORD | sudo -S echo "ServerName 192.168.33.10" >> /etc/apache2/apache2.conf
echo $PASSWORD | sudo -S systemctl restart apache2
echo $PASSWORD | sudo -S ufw app info "Apache Full"
echo $PASSWORD | sudo -S a2enmod rewrite
echo $PASSWORD | sudo -S systemctl restart apache2

#Install Mysql
echo $PASSWORD | sudo -S apt-get install mysql-server -y
mysql_secure_installation


#Install PHP
echo $PASSWORD | sudo -S apt-get install php libapache2-mod-php php-mcrypt php-mysql -y
echo $PASSWORD | sudo -S systemctl restart apache2
echo $PASSWORD | sudo -S apt-get install php-gd php-curl php-cgi php-cli php7.0-mcrypt php-mbstring -y
echo $PASSWORD | sudo -S touch /var/www/html/info.php
echo $PASSWRD  | sudo -S echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

#Install Composer
cd ~/
curl -sS https://getcomposer.org/installer -o composer-setup.php
echo $PASSWORD | sudo -S php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer

#Install Xdebug
echo $PASSWORD | sudo -S apt-get install php-xdebug -y
echo $PASSWORD | sudo -S echo "xdebug.remote_enable=1" >> /etc/php/7.0/apache2/php.ini
echo $PASSWORD | sudo -S systemctl restart apache2



