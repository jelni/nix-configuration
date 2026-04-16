{ config, pkgs, ... }:
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

  systemd.services.qbittorrent = {
    after = [ "i2pd.service" ];
    path = [ pkgs.netcat ];

    preStart = ''
      while ! nc -z ${config.services.i2pd.proto.sam.address} ${toString config.services.i2pd.proto.sam.port}; do
        sleep 1
      done
    '';

    requires = [ "i2pd.service" ];
  };
}
