{ inputs, flake, ... }:
{
  imports = [
    flake.nixosModules.jel
    inputs.nixos-hardware.nixosModules.framework-16-7040-amd
  ];
}
