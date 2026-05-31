{ flake, ... }:
{
  imports = with flake.nixosModules; [
    appimage
    dhcpcd
    gvfs
    location
    pipewire
    printing
    srvos-userspace
    udev
    udisks2
  ];
}
