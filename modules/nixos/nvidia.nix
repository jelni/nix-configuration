{ inputs, ... }:
{
  imports = [ "${inputs.nixos-hardware}/common/gpu/nvidia/pascal" ];
}
