{ inputs, ... }:
{
  imports = [ inputs.srvos.nixosModules.server ];
}
