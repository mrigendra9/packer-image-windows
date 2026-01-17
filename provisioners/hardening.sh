#!/bin/bash
set -e

echo "Disabling root SSH login..."
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

echo "Enforcing SSH key-based authentication..."
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

echo "Restarting SSH service..."
sudo systemctl restart ssh

echo "Configuring sysctl security parameters..."
cat <<EOF | sudo tee /etc/sysctl.d/99-custom-security.conf
net.ipv4.ip_forward = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
EOF

sudo sysctl --system
