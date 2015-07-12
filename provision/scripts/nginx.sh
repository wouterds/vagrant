#!/bin/bash

echo "Installing Nginx.."
apt-get install nginx -y

echo "Configuring Nginx.."
cp /vagrant/provision/config/nginx/nginx_vhost /etc/nginx/sites-available/nginx_vhost
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default

cp /vagrant/provision/config/nginx/www.my-project.dev /etc/nginx/sites-available/www.my-project.dev
ln -s /etc/nginx/sites-available/www.my-project.dev /etc/nginx/sites-enabled/

service nginx restart
