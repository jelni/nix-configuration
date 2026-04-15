{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    baremetal
    base
    utilities
  ];

  home.stateVersion = "25.11";
}
