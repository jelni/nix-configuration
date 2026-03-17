{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    initrd-ssh
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
