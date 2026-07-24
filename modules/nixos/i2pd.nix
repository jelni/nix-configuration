{ config, pkgs, ... }:
let
  sam = config.services.i2pd.proto.sam;
in
{
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

    monero.extraConfig = "tx-proxy=i2p,${sam.address}:${toString sam.port},disable_noise";
    qbittorrent.serverConfig.BitTorrent.Session.I2P.Enabled = true;
  };

  systemd.services.qbittorrent = {
    after = [ "i2pd.service" ];
    path = [ pkgs.netcat ];

    preStart = ''
      while ! nc -z ${sam.address} ${toString sam.port}; do
        sleep 1
      done
    '';

    requires = [ "i2pd.service" ];
  };
}
