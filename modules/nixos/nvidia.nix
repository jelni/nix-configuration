{ inputs, ... }:
{
  imports = [ "${inputs.nixos-hardware}/common/gpu/nvidia/pascal" ];
  hardware.nvidia.powerManagement.enable = true;
}
