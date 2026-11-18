#!/usr/bin/env bash
set -euo pipefail

# https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script

echo "Install docker"
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh
rm -f /tmp/get-docker.sh

echo "Setup group"
sudo usermod -a -G docker "${SUDO_USER:-$USER}"

echo "Setup services"
sudo systemctl enable --now docker

echo "Re-login (or run 'newgrp docker') to use docker without sudo"
