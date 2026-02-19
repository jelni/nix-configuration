{ ... }:
{
  networking.firewall.allowedTCPPorts = [ 8095 ];

  services.music-assistant = {
    enable = true;

    providers = [
      "filesystem_local"
      "lastfm_scrobble"
    ];
  };
}
