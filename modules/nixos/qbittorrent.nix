{ ... }:
{
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    profileDir = "/srv/";
  };
}
