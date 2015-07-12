# Basic Vagrant webserver / barebone

## Description

A basic barebone project I use for projects.

### Packages / software:

- Linux Debian Wheezy 64-bit
- NGINX ~1.2
- MySQL ~5.5
- PHP ~5.6
	- php5-fpm
	- php5-mysql
	- php5-curl
	- php5-mcrypt
	- php5-xdebug
- Git
- Composer
- NodeJS
	- grunt-cli
	- gulp
	- node-sass
	- bower

## Configuration

Most of the configuration is done in the [Vagrantfile](Vagrantfile), (directories, ip, os, name, hostname, cpus, memory etc..). The mysql configuration (root password) can be set in [mysql.sh](provision/scripts/mysql.sh) and the virtual host configuration can be set in [www.my-project.dev](provision/config/nginx/www.my-project.dev).

## Installation

Just run `vagrant up` and everything should be fine.

## Recommended tools

[http://vagrantmanager.com/](http://vagrantmanager.com/)

![demo.gif](http://vagrantmanager.com/demo.gif)
