{ flake, ... }:
{
  imports = with flake.nixosModules; [
    command-line-packages
    moor
    nix-ld
    nix-monitored
    safe-rm
    wget2
  ];
}
