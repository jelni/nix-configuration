{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    copyparty
    cron
    docker
    gonic
    initrd-ssh
    qbittorrent
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
