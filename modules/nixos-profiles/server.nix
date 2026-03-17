{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    gonic
    initrd-ssh
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
