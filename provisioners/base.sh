#!/bin/bash
set -e

echo "===== Updating system ====="
sudo apt-get update -y

echo "===== Enabling universe repository ====="
sudo apt-get install -y software-properties-common
sudo add-apt-repository universe -y

echo "===== Updating package list again ====="
sudo apt-get update -y

echo "===== Installing NGINX ====="
sudo apt-get install -y nginx

echo "===== Enabling & starting NGINX ====="
sudo systemctl enable nginx
sudo systemctl start nginx

echo "===== NGINX installation completed ====="
