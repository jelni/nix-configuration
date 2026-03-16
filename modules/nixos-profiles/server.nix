{ flake, ... }:
{
  imports = with flake.nixosModules; [
    initrd-ssh
    srvos-server
    user-rib
  ];
}
