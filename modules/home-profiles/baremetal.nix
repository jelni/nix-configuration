{ flake, ... }:
{
  imports = with flake.homeModules; [
    bottom
    htop
    ssh
  ];
}
