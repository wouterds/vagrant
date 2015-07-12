#!/bin/bash

echo "Installing Composer.."
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

echo "Installing NodeJS.."
curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
apt-get install --yes nodejs

echo "Installing NodeJS packages.."
npm install grunt-cli -g
npm install gulp -g
npm install bower -g
npm install node-sass -g
