{ flake, ... }:
{
  imports = with flake.nixosModules; [
    baremetal-users
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
    snowflake-proxy
    xserver
    zfs
  ];
}
