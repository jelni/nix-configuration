{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    base
    utilities
    wsl
  ];

  home.stateVersion = "25.11";
}
