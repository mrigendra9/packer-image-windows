#!/bin/bash
set -e

echo "Running waagent deprovision..."
sudo waagent -deprovision+user -force || true

echo "Generalization completed"
