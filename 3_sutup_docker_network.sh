#!/usr/bin/env bash
set -euo pipefail

docker network create domjudge
docker network create --internal domjudge_internal
