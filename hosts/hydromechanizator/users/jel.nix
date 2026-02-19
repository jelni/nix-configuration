{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    baremetal
    base
    userspace
  ];

  home.stateVersion = "25.05";
}
