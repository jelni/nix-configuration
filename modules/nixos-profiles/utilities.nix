{ flake, ... }:
{
  imports = with flake.nixosModules; [
    appimage
    moor
    nix-ld
    nix-monitored
    safe-rm
    utilities-packages
    wget2
  ];
}
