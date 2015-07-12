#!/bin/bash
#
echo "Installing MySQL.."
apt-get install debconf-utils -y
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
apt-get install mysql-server -q -y
