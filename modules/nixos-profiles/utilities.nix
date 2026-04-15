{ flake, ... }:
{
  imports = with flake.nixosModules; [
    moor
    nix-ld
    safe-rm
    utilities-packages
    wget2
  ];
}
