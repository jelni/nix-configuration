{ inputs, ... }:
{
  imports = [ inputs.srvos.nixosModules.mixins-latest-zfs-kernel ];
}
