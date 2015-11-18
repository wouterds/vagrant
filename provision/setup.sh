#!/bin/bash

echo "Preparing.."
export DEBIAN_FRONTEND=noninteractive
echo "Europe/Brussels" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# PHP 5.6 sources
echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list
cd /tmp
wget http://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg -y
apt-get update -y

echo "Installing Git.."
apt-get install git -y

echo "Installing Oh-my-zsh.."
apt-get install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Provisioning virtual machine.."
bash /vagrant/provision/scripts/mysql.sh
bash /vagrant/provision/scripts/php.sh
bash /vagrant/provision/scripts/nginx.sh
