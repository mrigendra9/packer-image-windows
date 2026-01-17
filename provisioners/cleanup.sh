#!/bin/bash
set -e

echo "Cleaning up temporary files..."
sudo apt-get autoremove -y
sudo apt-get clean

echo "Removing SSH host keys..."
sudo rm -f /etc/ssh/ssh_host_*

echo "Clearing logs..."
sudo find /var/log -type f -exec truncate -s 0 {} \;
