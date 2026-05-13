{ flake, ... }:
{
  imports = with flake.homeModules; [
    aria2
    bat
    delta
    direnv
    eza
    fastfetch
    fzf
    gcc
    github
    ripgrep
    uv
    zoxide
  ];
}
