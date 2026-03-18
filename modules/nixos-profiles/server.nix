{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    docker
    gonic
    initrd-ssh
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
