{ flake, ... }:
{
  imports = [ flake.nixosModules.latest-zfs-kernel ];
}
