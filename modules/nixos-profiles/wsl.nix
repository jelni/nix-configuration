{ flake, ... }:
{
  imports = with flake.nixosModules; [
    postgresql
    wsl
    wsl-users
  ];
}
