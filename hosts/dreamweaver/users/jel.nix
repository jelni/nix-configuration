{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    baremetal
    base
    command-line
  ];

  home.stateVersion = "25.11";
}
