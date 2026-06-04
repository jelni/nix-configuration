{ flake, ... }:
{
  imports = [ flake.nixosModules.security ];
}
