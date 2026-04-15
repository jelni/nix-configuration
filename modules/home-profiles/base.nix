{ flake, ... }:
{
  imports = with flake.homeModules; [
    fish
    home-manager
    jujutsu
  ];
}
