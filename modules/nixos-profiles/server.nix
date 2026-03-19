{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    docker
    gonic
    initrd-ssh
    qbittorrent
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
