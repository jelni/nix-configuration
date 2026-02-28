{ flake, inputs, ... }:
{
  imports = [
    flake.nixosModules.wsl
    inputs.nixos-wsl.nixosModules.default
  ];
}
