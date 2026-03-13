{ flake, ... }:
{
  imports = with flake.nixosModules; [
    postgresql
    srvos-wsl
    wsl
    wsl-users
  ];
}
