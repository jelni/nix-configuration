{ flake, ... }:
{
  imports = with flake.modules.nixos-profiles; [
    base
    wsl
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
}
