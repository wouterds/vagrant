#!/bin/bash

echo "Preparing.."
export DEBIAN_FRONTEND=noninteractive
echo "Europe/Brussels" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
apt-get update -y

echo "Installing Oh-my-zsh.."
apt-get install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Installing Git.."
apt-get install git -y

echo "Provisioning virtual machine.."

bash /vagrant/provision/scripts/mysql.sh
bash /vagrant/provision/scripts/php.sh
bash /vagrant/provision/scripts/nginx.sh
bash /vagrant/provision/scripts/misc.sh
