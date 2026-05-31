{ flake, ... }:
{
  imports = with flake.modules.nixos-profiles; [
    baremetal
    base
    command-line
    installation-cd
    utilities
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
