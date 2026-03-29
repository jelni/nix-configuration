{ flake, ... }:
{
  imports = with flake.nixosModules; [
    cloudflared
    copyparty
    cron
    docker
    etherpad
    gonic
    gotosocial
    home-assistant
    i2pd
    initrd-ssh
    kubo
    music-assistant
    qbittorrent
    snowflake-proxy
    srvos-server
    user-rib
  ];
}
