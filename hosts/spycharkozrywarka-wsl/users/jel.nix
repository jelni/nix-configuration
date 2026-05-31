{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    base
    command-line
    wsl
  ];

  home.stateVersion = "25.11";
}
