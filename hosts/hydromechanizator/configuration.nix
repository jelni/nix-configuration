{ flake, ... }:
{
  imports = with flake.modules.nixos-profiles; [
    baremetal
    base
    command-line
    framework-16-7040-amd
    hardening
    latest-zfs-kernel
    userspace
    utilities
  ];

  networking.hostId = "d0eca1a0";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
