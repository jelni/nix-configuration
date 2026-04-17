# nix-configuration

my NixOS configuration. it uses Nix flakes,
[blueprint](https://github.com/numtide/blueprint),
[Home Manager](https://github.com/nix-community/home-manager), and some woke
modern software like [uutils](https://github.com/uutils/coreutils) or
[doas](https://codeberg.org/thejessesmith/doas).

## Profiles

this configuration is comprised of [NixOS](modules/nixos-profiles) and
[Home Manager profiles](modules/home-profiles) that enable corresponding
[NixOS](modules/nixos) and [Home Manager modules](modules/home). this list
documents when each profile should be used for a host.

### NixOS

- [`base`](modules/nixos-profiles/base.nix) &ndash; all hosts
- [`baremetal`](modules/nixos-profiles/baremetal.nix) &ndash; hosts where the
  boot process should be configured
- [`utilities`](modules/nixos-profiles/utilities.nix) &ndash; hosts that are
  interacted with using the command line
- [`userspace`](modules/nixos-profiles/userspace.nix) &ndash; hosts that are
  interacted with using a graphical interface
- [`server`](modules/nixos-profiles/server.nix) &ndash; hosts that serve my
  services
- [`wsl`](modules/nixos-profiles/wsl.nix) &ndash; Windows Subsystem for Linux
  hosts
- [`framework-16-7040-amd`](modules/nixos-profiles/framework-16-7040-amd.nix)
  &ndash; hosts that are the Framework Laptop 16 (AMD Ryzen™ 7040 Series)
- [`nvidia`](modules/nixos-profiles/nvidia.nix) &ndash; hosts that have an
  NVIDIA graphics card
- [`latest-zfs-kernel`](modules/nixos-profiles/latest-zfs-kernel.nix) &ndash;
  bare metal hosts that _don't_ have an NVIDIA graphics card

### Home Manager

- [`base`](modules/home-profiles/base.nix) &ndash; all hosts
- [`baremetal`](modules/home-profiles/baremetal.nix) &ndash; hosts where the
  boot process should be configured
- [`utilities`](modules/home-profiles/utilities.nix) &ndash; hosts that are
  interacted with using the command line
- [`userspace`](modules/home-profiles/userspace.nix) &ndash; hosts that are
  interacted with using a graphical interface
- [`wsl`](modules/home-profiles/wsl.nix) &ndash; Windows Subsystem for Linux
  hosts
- [`wsl-1password`](modules/home-profiles/wsl-1password.nix) &ndash; Windows
  Subsystem for Linux hosts that run 1Password on Windows
