{ flake, ... }:
{
  imports = with flake.nixosModules; [
    caddy
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
    matrix-tuwunel
    music-assistant
    qbittorrent
    snowflake-proxy
    soju
    srvos-server
    tangled
    user-rib
  ];
}
