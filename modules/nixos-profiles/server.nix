{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    copyparty
    cron
    docker
    etherpad
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
