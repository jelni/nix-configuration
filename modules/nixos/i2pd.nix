{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [ config.services.i2pd.proto.http.port ];

  services = {
    i2pd = {
      enable = true;
      bandwidth = 1024;
      enableIPv6 = true;

      proto = {
        http = {
          enable = true;
          address = "0.0.0.0";
          strictHeaders = false;
        };

        sam.enable = true;
      };

      upnp.enable = true;
    };

    qbittorrent.serverConfig.BitTorrent.Session.I2P.Enabled = true;
  };
}
