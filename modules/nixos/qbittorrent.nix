{ ... }:
{
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    profileDir = "/srv/";
    torrentingPort = 25556;
  };
}
