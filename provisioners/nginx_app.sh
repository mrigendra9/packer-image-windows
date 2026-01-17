#!/bin/bash
set -e

echo "===== OS Update ====="
sudo apt-get update -y

echo "===== Installing NGINX ====="
sudo apt-get install -y nginx git

echo "===== Enable & Start NGINX ====="
sudo systemctl enable nginx
sudo systemctl start nginx

echo "===== Removing default html ====="
sudo rm -rf /var/www/html/*

echo "===== Cloning Application from GitHub ====="
sudo git clone https://github.com/devopsinsiders/StreamFlix.git /var/www/html

echo "===== Setting Permissions ====="
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

echo "===== NGINX Status ====="
sudo systemctl status nginx --no-pager
