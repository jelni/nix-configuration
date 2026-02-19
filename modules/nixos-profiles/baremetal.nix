{ flake, ... }:
{
  imports = with flake.nixosModules; [
    boot
    dns
    firewall
    fwupd
    hardware
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
