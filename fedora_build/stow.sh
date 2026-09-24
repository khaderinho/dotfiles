#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "$script_dir/.." && pwd)"

if ! command -v stow >/dev/null 2>&1; then
    printf 'GNU Stow is required. Install it and run this script again.\n' >&2
    exit 1
fi

mkdir -p "$HOME/.config"

# Remove an existing bash configuration before Stow creates its symlink.
rm -f "$HOME/.bashrc"

# These packages contain files that belong directly in the home directory.
stow --dir="$repo_dir" --target="$HOME" --stow bash vim xorg

# All other configuration packages are linked beneath ~/.config.
config_packages=()
for package_dir in "$repo_dir"/*/; do
    [[ -d "$package_dir" ]] || continue
    package="${package_dir%/}"
    package="${package##*/}"
    case "$package" in
        bash|vim|xorg|fedora_build) continue ;;
    esac
    config_packages+=("$package")
done

if ((${#config_packages[@]})); then
    for package in "${config_packages[@]}"; do
        mkdir -p "$HOME/.config/$package"
        stow --dir="$repo_dir" --target="$HOME/.config/$package" --stow "$package"
    done
fi

printf 'Configuration links created successfully.\n'
