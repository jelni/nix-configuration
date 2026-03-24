{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    copyparty
    cron
    docker
    gonic
    home-assistant
    initrd-ssh
    music-assistant
    qbittorrent
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
