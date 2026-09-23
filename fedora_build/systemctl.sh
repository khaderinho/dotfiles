#!/usr/bin/env bash
set -euo pipefail

sudo systemctl enable --now bluetooth
sudo systemctl enable --now NetworkManager
systemctl --user enable --now pipewire pipewire-pulse
