{ flake, ... }:
{
  imports = with flake.nixosModules; [
    caddy
    cloudflared
    cobalt-api
    copyparty
    cron
    docker
    dynamic-dns
    etherpad
    gonic
    gotosocial
    home-assistant
    i2pd
    initrd-ssh
    kubo
    matrix-tuwunel
    music-assistant
    podman
    qbittorrent
    snowflake-proxy
    soju
    srvos-server
    tangled
    user-rib
  ];
}
