# nix-configuration

my NixOS configuration. it uses Nix flakes, [Lix](https://lix.systems/),
[blueprint](https://github.com/numtide/blueprint),
[Home Manager](https://github.com/nix-community/home-manager),
[agenix](https://github.com/ryantm/agenix),
[SrvOS](https://github.com/nix-community/srvos), and some woke modern software
like [uutils](https://github.com/uutils/coreutils) or
[doas](https://codeberg.org/thejessesmith/doas).

## profiles

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

## new host setup

a few imperative steps are required when installing NixOS on a new device.

- reset Secure Boot settings in BIOS
- create a 1 GiB FAT32 partition with a `NIXBOOT` label, and a cleared partition
- configure ZFS
  - create a zpool

    ```
    zpool create -O atime=off -O encryption=on -O keyformat=passphrase -O mountpoint=none -O utf8only=on -R /mnt zpool /dev/<cleared-partition>
    ```

  - create volumes

    ```
    zfs create zpool/root -o mountpoint=/
    zfs create zpool/nix -o mountpoint=/nix
    zfs create zpool/var -o mountpoint=/var -o com.sun:auto-snapshot=true
    zfs create zpool/home -o mountpoint=/home -o com.sun:auto-snapshot=true
    ```

- create a new entry in [hosts](hosts)
  - set kernel modules detected by `nixos-generate-config`
  - generate the host SSH key, and encrypt [secrets](secrets/secrets.nix) with
    it

  ```
  mkdir --parents /mnt/etc/ssh
  ssh-keygen -f /mnt/etc/ssh/ssh_host_ed25519_key -N "" -t ed25519
  ```

- enroll Secure Boot keys

  ```
  nix-shell -p sbctl
  sbctl create-keys
  sbctl enroll-keys --firmware-builtin --microsoft
  cp --archive /var/lib/sbctl /mnt/var/lib/
  ```

- mount `/boot`

  ```
  mount --mkdir /dev/disk/by-label/NIXBOOT /mnt/boot
  ```

- install NixOS

  ```
  nixos-install --flake #<hostname>
  ```

- allow the new system with a different host ID to import the zpool

  ```
  zpool export zpool
  ```

- reboot, and enable Secure Boot in BIOS
- done!
