{ flake, ... }:
{
  imports = with flake.nixosModules; [
    wsl
    wsl-users
  ];
}
