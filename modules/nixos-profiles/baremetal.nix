{ flake, ... }:
{
  imports = with flake.nixosModules; [
    boot
    dns
    firewall
    fwupd
    hardware
    kmscon
    limine
    networkmanager
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
  ];
}
