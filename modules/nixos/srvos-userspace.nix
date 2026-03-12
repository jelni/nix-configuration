{ inputs, ... }:
{
  imports = with inputs.srvos.nixosModules; [
    desktop
    mixins-terminfo
  ];
}
