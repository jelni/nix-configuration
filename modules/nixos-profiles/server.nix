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
    i2pd
    initrd-ssh
    music-assistant
    qbittorrent
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
