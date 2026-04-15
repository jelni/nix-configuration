{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    baremetal
    base
    userspace
    utilities
  ];

  home.stateVersion = "25.05";
}
