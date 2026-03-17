{ flake, ... }:
{
  imports = with flake.nixosModules; [
    initrd-ssh
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
