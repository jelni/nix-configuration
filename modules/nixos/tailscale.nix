{
  services = {
    tailscale = {
      enable = true;
      extraSetFlags = [ "--ssh" ];
      openFirewall = true;
    };

    qbittorrent.serverConfig.Preferences.WebUI = {
      AuthSubnetWhitelist = "100.64.0.0/10, fd7a:115c:a1e0::/48";
      AuthSubnetWhitelistEnabled = true;
    };
  };
}
