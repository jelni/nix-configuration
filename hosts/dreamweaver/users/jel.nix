{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    baremetal
    base
  ];

  home.stateVersion = "25.11";
}
