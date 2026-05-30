#!/usr/bin/env bash
set -euo pipefail

sudo ufw status

sudo ufw allow ssh

sudo ufw enable

sudo reboot
