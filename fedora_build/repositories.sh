#!/usr/bin/env bash
set -euo pipefail

sudo dnf install -y dnf5-plugins

# Brave Browser repository
if [[ ! -f /etc/yum.repos.d/brave-browser.repo ]]; then
    sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
fi
