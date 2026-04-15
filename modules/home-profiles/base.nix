{ flake, ... }:
{
  imports = with flake.homeModules; [
    aria2
    bat
    delta
    direnv
    eza
    fish
    fzf
    gcc
    github
    home-manager
    jujutsu
    ripgrep
    uv
    zoxide
  ];
}
