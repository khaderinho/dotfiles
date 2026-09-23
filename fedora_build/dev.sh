#!/usr/bin/env bash
set -euo pipefail

sudo dnf group install -y "Development Tools"
sudo dnf install -y git wget curl openssh stow opendoas
