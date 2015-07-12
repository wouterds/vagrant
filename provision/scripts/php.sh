#!/bin/bash

# PHP 5.6 sources
echo "deb http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list
wget http://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg -y
apt-get update -y

echo "Installing PHP core.."
apt-get install php5-dev -y
apt-get install php-pear -y
apt-get install php5-cli -y
apt-get install php5-fpm -y

echo "Installing other PHP extensions.."
apt-get install php5-mysqlnd -y
apt-get install php5-curl -y
apt-get install php5-mcrypt -y
apt-get install php5-xdebug -y

echo "Configuring PHP cli.."
echo "display_errors = On" >> /etc/php5/cli/php.ini
echo "error_reporting = E_ALL & ~E_NOTICE" >> /etc/php5/cli/php.ini
echo "display_startup_errors = On" >> /etc/php5/cli/php.ini
echo "date.timezone = Europe/Brussels" >> /etc/php5/cli/php.ini

echo "Configuring PHP fpm.."
echo "display_errors = On" >> /etc/php5/fpm/php.ini
echo "error_reporting = E_ALL & ~E_NOTICE" >> /etc/php5/fpm/php.ini
echo "display_startup_errors = On" >> /etc/php5/fpm/php.ini
echo "date.timezone = Europe/Brussels" >> /etc/php5/fpm/php.ini
echo "cgi.fix_pathinfo=0" >> /etc/php5/fpm/php.ini
echo "listen = /var/run/php5-fpm.sock" >> /etc/php5/fpm/pool.d/www.conf

service php5-fpm restart
