#!/usr/bin/env bash
set -euo pipefail

sudo dnf install -y @development-tools
sudo dnf install -y git wget curl openssh stow opendoas code
