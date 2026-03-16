{ flake, ... }:
{
  imports = with flake.nixosModules; [
    postgresql
    srvos-wsl
    user-jel-wsl
    wsl
  ];
}
