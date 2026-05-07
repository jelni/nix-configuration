{ flake, ... }:
{
  imports = with flake.nixosModules; [
    moor
    nix-ld
    nix-monitored
    safe-rm
    utilities-packages
    wget2
  ];
}
