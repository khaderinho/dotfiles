# Configs

Personal configuration files and installation scripts for a Fedora Server setup with an i3/BSPWM based X11 desktop.

## Fedora Server installation

Start with a fresh Fedora Server installation and a user account that can run commands with `sudo`. Clone this repository, enter it, and run:

```console
git clone git@github.com:khedrinhoo/configs.git
cd configs
bash fedora_build/install.sh
```

The scripts expect an internet connection and GNU Stow. The installer installs GNU Stow through DNF. Run the installer as your regular user, not as root, so the configuration files are linked into that user's home directory. `sudo` is used by the scripts for system package and service operations.

If an installation script fails, the installer reports the failed script names and exits without linking the configurations. Resolve the reported issue and run the installer again; its package and link steps can be repeated.

## Configuration links

`fedora_build/stow.sh` links `bash`, `vim`, and `xorg` files directly into `$HOME`. The remaining configuration directories are linked into their matching subdirectories under `$HOME/.config`, such as `i3/config` to `$HOME/.config/i3/config`.

To create or refresh the links separately, run:

```console
bash fedora_build/stow.sh
```

GNU Stow leaves conflicting existing files in place and reports the conflict. Move or back up the conflicting file, then run the command again.
