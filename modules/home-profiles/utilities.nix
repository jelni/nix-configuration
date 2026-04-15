{ flake, ... }:
{
  imports = with flake.homeModules; [
    aria2
    bat
    delta
    direnv
    eza
    fzf
    gcc
    github
    ripgrep
    uv
    zoxide
  ];
}
