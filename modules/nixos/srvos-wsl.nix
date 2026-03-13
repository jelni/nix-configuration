{ inputs, ... }:
{
  imports = [ inputs.srvos.nixosModules.common ];
  networking.useNetworkd = false;
}
