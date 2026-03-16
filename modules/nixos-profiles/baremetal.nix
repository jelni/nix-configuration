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
    snowflake-proxy
    user-jel
    xserver
    zfs
  ];
}
