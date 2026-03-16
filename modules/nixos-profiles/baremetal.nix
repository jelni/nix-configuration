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
    stylix
    user-jel
    xserver
    zfs
  ];
}
