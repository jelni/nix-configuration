{ flake, ... }:
{
  imports = with flake.nixosModules; [
    baremetal-packages
    boot
    dns
    fwupd
    hardware
    kmscon
    limine
    networkmanager
    nftables
    ntp
    plymouth
    postgresql
    power-management
    stylix
    tailscale
    terminfo
    user-jel
    xserver
    zfs
    zram-swap
  ];
}
