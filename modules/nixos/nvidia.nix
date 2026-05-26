{ inputs, ... }:
{
  imports = [ "${inputs.nixos-hardware}/common/gpu/nvidia/pascal" ];

  hardware.nvidia = {
    branch = "legacy_580";
    powerManagement.enable = true;
  };
}
