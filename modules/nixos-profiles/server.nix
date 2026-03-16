{ flake, ... }:
{
  imports = with flake.nixosModules; [
    srvos-server
    user-rib
  ];
}
