{ flake, ... }:
{
  imports = with flake.modules.nixos-profiles; [
    baremetal
    base
    framework-16-7040-amd
    userspace
  ];

  networking.hostId = "d0eca1a0";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
