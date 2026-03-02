{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    base
    wsl
  ];

  home.stateVersion = "25.11";
}
