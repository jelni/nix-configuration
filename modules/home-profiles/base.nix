{ flake, ... }:
{
  imports = with flake.homeModules; [
    aria2
    bat
    delta
    direnv
    eza
    fish
    gcc
    github
    home-manager
    jujutsu
    ripgrep
    uv
  ];
}
