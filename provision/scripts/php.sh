#!/bin/bash

echo "Installing PHP core.."
apt-get install php5 -y
apt-get install php5-cli -y
apt-get install php5-fpm -y

echo "Installing other PHP extensions.."
apt-get install php5-mysqlnd -y
apt-get install php5-curl -y
apt-get install php5-mcrypt -y

echo "Configuring PHP cli.."
echo "display_errors = On" >> /etc/php5/cli/php.ini
echo "display_startup_errors = On" >> /etc/php5/cli/php.ini
echo "error_reporting = E_ALL" >> /etc/php5/cli/php.ini
echo "date.timezone = Europe/Brussels" >> /etc/php5/cli/php.ini

echo "Configuring PHP fpm.."
echo "display_errors = On" >> /etc/php5/fpm/php.ini
echo "display_startup_errors = On" >> /etc/php5/fpm/php.ini
echo "error_reporting = E_ALL" >> /etc/php5/fpm/php.ini
echo "date.timezone = Europe/Brussels" >> /etc/php5/fpm/php.ini
echo "cgi.fix_pathinfo=0" >> /etc/php5/fpm/php.ini
echo "listen = /var/run/php5-fpm.sock" >> /etc/php5/fpm/pool.d/www.conf

service php5-fpm restart
