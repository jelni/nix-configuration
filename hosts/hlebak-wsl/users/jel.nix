{ flake, ... }:
{
  imports = with flake.modules.home-profiles; [
    base
    command-line
    wsl
    wsl-1password
  ];

  home.stateVersion = "25.11";
}
