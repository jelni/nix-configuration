{ flake, ... }:
{
  imports = [ flake.nixosModules.nvidia ];
}
