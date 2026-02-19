{ flake, inputs, ... }:
{
  imports =
    (with flake.modules.nixos-profiles; [
      baremetal
      base
      userspace
    ])
    ++ [ inputs.nixos-hardware.nixosModules.framework-16-7040-amd ];

  networking.hostId = "d0eca1a0";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
