#!/usr/bin/env bash
set -euo pipefail

# https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions
echo "Uninstall old versions"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
  sudo apt-get remove -y "$pkg" || true
done

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
