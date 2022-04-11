#!/bin/bash

cd /var/www/pterodactyl/public/
mkdir pma
cd pma
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.2-all-languages.zip
unzip phpMyAdmin-5.1.2-all-languages.zip
mv phpMyAdmin-5.1.2-all-languages/* /var/www/pterodactyl/public/pma
rm -rf phpM*
mkdir /var/www/pterodactyl/public/pma/tmp
chmod -R 777 /var/www/pterodactyl/public/pma/tmp

cd /var/www/pterodactyl/resources/scripts/routers/
rm -r ServerRouter.tsx
wget https://raw.githubusercontent.com/Daniel-Farmer/MyPhpAdmin/main/ServerRouter.tsx

apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt -y install nodejs
cd /var/www/pterodactyl
npm i -g yarn
yarn install
yarn build:production
chown -R www-data:www-data *
